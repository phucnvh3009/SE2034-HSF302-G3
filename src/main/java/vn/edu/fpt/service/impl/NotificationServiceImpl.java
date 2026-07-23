package vn.edu.fpt.service.impl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.NotificationDTO;
import vn.edu.fpt.dto.response.domstaff.Notification4StaffDto;
import vn.edu.fpt.model.DormitoryBuilding;
import vn.edu.fpt.model.Notification;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.Contract;
import vn.edu.fpt.model.constant.ContractStatus;
import vn.edu.fpt.repository.ContractRepository;
import vn.edu.fpt.repository.DormitoryBuildingRepository;
import vn.edu.fpt.repository.NotificationRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.NotificationService;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Dữ liệu tĩnh - dùng để demo cho giáo viên duyệt
 */
@Service
@AllArgsConstructor
public class NotificationServiceImpl implements NotificationService {
    private DormitoryBuildingRepository dormitoryBuildingRepository;
    private UserRepository userRepository;
    private NotificationRepository notificationRepository;
    private ContractRepository contractRepository;

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> getNotificationsForUser(User user) {
        Long buildingId = -1L;
        if (user.getBuilding() != null) {
            buildingId = user.getBuilding().getId();
        } else {
            Optional<Contract> activeContractOpt = contractRepository.findFirstByStudentIdAndStatus(user.getId(), ContractStatus.ACTIVE);
            if (activeContractOpt.isPresent() && activeContractOpt.get().getBed() != null && activeContractOpt.get().getBed().getRoom() != null && activeContractOpt.get().getBed().getRoom().getFloor() != null && activeContractOpt.get().getBed().getRoom().getFloor().getBuilding() != null) {
                buildingId = activeContractOpt.get().getBed().getRoom().getFloor().getBuilding().getId();
            }
        }
        
        List<Notification> notifications = notificationRepository.findNotificationsForUser(buildingId, user.getId());
        return notifications.stream().map(this::mapToDTO).collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public List<NotificationDTO> getNotificationsByTypeAndUser(String type, User user) {
        if (type == null || type.isBlank()) {
            return getNotificationsForUser(user);
        }
        return getNotificationsForUser(user).stream()
                .filter(n -> n.getType().equalsIgnoreCase(type))
                .collect(Collectors.toList());
    }

    @Override
    public void sendNotification(Notification4StaffDto dto, User sender) {
        Notification notification = new Notification();
        notification.setTitle(dto.getTitle());
        notification.setContent(dto.getContent());
        notification.setCategory(dto.getCategory());
        notification.setSender(sender);
        notification.setTargetType(dto.getTargetType());
        if (sender.getBuilding() != null) {
            DormitoryBuilding dom = dormitoryBuildingRepository.findById(sender.getBuilding().getId()).orElseThrow(() -> new RuntimeException("Không tìm thấy tòa nhà với ID: " + sender.getBuilding().getId()));
            notification.setTargetBuilding(dom);
        }
        if (dto.getStudentCode() != null && !dto.getStudentCode().isBlank()) {
            User student = userRepository.findByStudentCode(dto.getStudentCode()).orElseThrow(() -> new RuntimeException("Không tìm thấy sinh viên với mã: " + dto.getStudentCode()));
            notification.setTargetStudent(student);
        }
        notificationRepository.save(notification);
    }

    @Override
    @Transactional(readOnly = true)
    public long countUnread(User user) {
        // Tạm thời đếm tổng số thông báo vì chưa có bảng trạng thái read
        return getNotificationsForUser(user).size();
    }

    private NotificationDTO mapToDTO(Notification n) {
        NotificationDTO dto = new NotificationDTO();
        dto.setId(n.getId());
        dto.setTitle(n.getTitle());
        dto.setContent(n.getContent());
        dto.setType(n.getCategory() != null ? n.getCategory().name() : "system");

        if (n.getCreatedAt() != null) {
            java.time.Duration duration = java.time.Duration.between(n.getCreatedAt(), java.time.Instant.now());
            if (duration.toDays() > 0) dto.setTimeAgo(duration.toDays() + " ngày trước");
            else if (duration.toHours() > 0) dto.setTimeAgo(duration.toHours() + " giờ trước");
            else if (duration.toMinutes() > 0) dto.setTimeAgo(duration.toMinutes() + " phút trước");
            else dto.setTimeAgo("Vừa xong");
        } else {
            dto.setTimeAgo("N/A");
        }
        dto.setRead(false);
        return dto;
    }
}
