package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.dto.request.ManagerRequest;
import vn.edu.fpt.dto.response.ManagerDTO;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.RoleName;
import vn.edu.fpt.repository.DormitoryBuildingRepository;
import vn.edu.fpt.repository.RoleRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.DormManagerService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DormManagerServiceImpl implements DormManagerService {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    @Override
    @Transactional(readOnly = true)
    public List<ManagerDTO> getAllManagers() {

        List<User> managers = userRepository.findAllByRoleName(RoleName.ROLE_MANAGER);

        return managers.stream().map(this::mapToDTO).collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public ManagerDTO getManagerById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy quản lý với ID: " + id));

        return mapToDTO(user);
    }

    @Override
    public ManagerDTO createManager(ManagerRequest request) {
        return null;
    }

    @Override
    public void toggleManagerStatus(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy quản lý với ID: " + id));
        user.setIsActive(!user.getIsActive());
        userRepository.save(user);
    }

    private ManagerDTO mapToDTO(User user) {
        ManagerDTO dto = new ManagerDTO();

        dto.setId(user.getId());
        dto.setEmail(user.getEmail());
        dto.setFullName(user.getFirstName() + user.getMiddleName() + " " + user.getLastName());
        dto.setPhone(user.getPhone());
        dto.setGender(user.getGender());
        dto.setDob(user.getDob());
        dto.setAvatar(user.getAvatar());
        dto.setIsActive(user.getIsActive());
        dto.setCreatedAt(user.getCreatedAt());

        return dto;
    }


}
