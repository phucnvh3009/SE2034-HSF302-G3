package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.response.StaffListResponse;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.RoleName;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.StaffService;

import java.util.List;
import java.util.stream.Collectors;

import vn.edu.fpt.dto.request.StaffCreateRequest;
import vn.edu.fpt.model.Floor;
import vn.edu.fpt.model.Role;
import vn.edu.fpt.model.StaffFloorAssignment;
import vn.edu.fpt.model.UserRole;
import vn.edu.fpt.model.constant.CommonStatus;
import vn.edu.fpt.repository.FloorRepository;
import vn.edu.fpt.repository.RoleRepository;
import vn.edu.fpt.repository.StaffFloorAssignmentRepository;

import java.time.LocalDate;
import java.util.Collections;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final FloorRepository floorRepository;
    private final StaffFloorAssignmentRepository staffFloorAssignmentRepository;

    @Override
    public List<StaffListResponse> getStaffsByManagerId(Long managerId) {
        User manager = userRepository.findById(managerId).orElse(null);
        if (manager == null || manager.getBuilding() == null) {
            return Collections.emptyList();
        }
        List<User> staffUsers = userRepository.searchStaffsByBuildingIdAndKeywordAndStatus(
                manager.getBuilding().getId(), RoleName.ROLE_STAFF, null, true);
        return staffUsers.stream().map(user -> StaffListResponse.builder()
                .id(user.getId())
                .fullName(user.getLastName() + " " + (user.getMiddleName() != null ? user.getMiddleName() + " " : "") + user.getFirstName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .gender(user.getGender().name())
                .isActive(user.getIsActive())
                .build()).collect(Collectors.toList());
    }

    @Override
    public void createStaff(StaffCreateRequest request, Long managerId) {
        // 1. Create User
        User user = new User();
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setGender(request.getGender());
        user.setPasswordHash(request.getPassword()); // TODO: Implement password hashing (e.g. BCrypt) later

        // 2. Assign Role DORM_STAFF
        Role role = roleRepository.findByRoleName(RoleName.ROLE_STAFF)
                .orElseThrow(() -> new RuntimeException("Role not found"));
        UserRole userRole = new UserRole();
        userRole.setUser(user);
        userRole.setRole(role);
        user.setUserRoles(Collections.singleton(userRole));

        // Save user first to get ID
        User savedUser = userRepository.save(user);

        // 3. Assign Floor
        Floor floor = floorRepository.findById(request.getFloorId())
                .orElseThrow(() -> new RuntimeException("Floor not found"));
        
        // Verify that the floor belongs to the manager's building
        User manager = userRepository.findById(managerId).orElse(null);
        if (manager == null || manager.getBuilding() == null || !floor.getBuilding().getId().equals(manager.getBuilding().getId())) {
            throw new RuntimeException("Unauthorized: Floor does not belong to your building");
        }

        StaffFloorAssignment assignment = new StaffFloorAssignment();
        assignment.setStaff(savedUser);
        assignment.setFloor(floor);
        assignment.setAssignedDate(LocalDate.now());
        assignment.setStatus(CommonStatus.ACTIVE);

        staffFloorAssignmentRepository.save(assignment);
    }
}
