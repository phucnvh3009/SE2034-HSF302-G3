package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.model.Role;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.UserRole;
import vn.edu.fpt.model.constant.RoleName;
import vn.edu.fpt.dto.request.ManagerRequest;
import vn.edu.fpt.dto.response.ManagerDTO;
import vn.edu.fpt.repository.RoleRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.DormManagementService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@RequiredArgsConstructor
public class DormManagementServiceImpl implements DormManagementService {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    @Override
    @Transactional(readOnly = true)
    public List<ManagerDTO> getAllManagers() {
        List<User> managers = userRepository.findAllByRoleName(RoleName.ROLE_MANAGER);
        return managers.stream().map(this::mapToResponse).collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public ManagerDTO getManagerById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy quản lý với ID: " + id));
        return mapToResponse(user);
    }

    @Override
    public void createManager(ManagerRequest request) {

        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new IllegalArgumentException("Email này đã tồn tại trong hệ thống!");
        }

        User user = new User();
        user.setEmail(request.getEmail());
        user.setPasswordHash(request.getPassword());
        user.setFirstName(request.getFirstName());
        user.setMiddleName(request.getMiddleName());
        user.setLastName(request.getLastName());
        user.setPhone(request.getPhone());
        user.setGender(request.getGender());
        user.setDob(request.getDob());
        user.setIsActive(true);

        // Tìm và gán Role MANAGER
        Role managerRole = roleRepository.findByRoleName(RoleName.ROLE_MANAGER)
                .orElseThrow(() -> new IllegalStateException("Không tìm thấy vai trò ROLE_MANAGER trong hệ thống!"));

        UserRole userRole = new UserRole();
        userRole.setUser(user);
        userRole.setRole(managerRole);
        user.getUserRoles().add(userRole);

        userRepository.save(user);
    }

    @Override
    public void toggleManagerStatus(Long id) {

        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy quản lý với ID: " + id));
        user.setIsActive(!user.getIsActive());

        userRepository.save(user);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ManagerDTO> searchManagers(String keyword, Boolean status) {

        String stringKeyword = (keyword != null && !keyword.trim().isEmpty()) ? keyword.trim() : null;
        List<User> managers = userRepository.searchManagers(RoleName.ROLE_MANAGER, stringKeyword, status);

        return managers.stream().map(this::mapToResponse).collect(Collectors.toList());
    }

    private ManagerDTO mapToResponse(User user) {
        ManagerDTO response = new ManagerDTO();
        response.setId(user.getId());
        response.setEmail(user.getEmail());

        String fullName = user.getLastName();
        if (user.getMiddleName() != null && !user.getMiddleName().trim().isEmpty()) {
            fullName += " " + user.getMiddleName();
        }
        fullName += " " + user.getFirstName();
        response.setFullName(fullName);

        response.setPhone(user.getPhone());
        response.setGender(user.getGender());
        response.setDob(user.getDob());
        response.setAvatar(user.getAvatar());
        response.setIsActive(user.getIsActive());
        response.setCreatedAt(user.getCreatedAt());
        response.setBuildingName(user.getBuilding() != null ? user.getBuilding().getName() : null);

        return response;
    }
}
