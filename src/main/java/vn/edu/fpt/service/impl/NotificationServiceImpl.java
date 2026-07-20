package vn.edu.fpt.service.impl;

import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.NotificationDTO;
import vn.edu.fpt.service.NotificationService;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Dữ liệu tĩnh - dùng để demo cho giáo viên duyệt
 */
@Service
public class NotificationServiceImpl implements NotificationService {

    private static final List<NotificationDTO> NOTIFICATIONS = Arrays.asList(
        new NotificationDTO(1L,
            "Nhắc nhở hóa đơn",
            "Hóa đơn HD-2024-0089 số tiền 4.292.000đ đến hạn ngày 15/07/2024.",
            "payment", "2 giờ trước", false),

        new NotificationDTO(2L,
            "Cúp nước",
            "Khu vực ký túc xá sẽ cúp nước ngày 28/06/2024 từ 9:00 - 12:00 để bảo trì.",
            "announcement", "Hôm qua", false),

        new NotificationDTO(3L,
            "Cập nhật phiếu sửa chữa #PR-0042",
            "Yêu cầu sửa điều hòa đang được xử lý. Kỹ thuật viên: Anh Sơn.",
            "maintenance", "2 ngày trước", false),

        new NotificationDTO(4L,
            "Cập nhật nội quy",
            "Nội quy về khách thăm được cập nhật - khách chỉ được vào trước 22:00.",
            "system", "3 ngày trước", true),

        new NotificationDTO(5L,
            "Xác nhận thanh toán",
            "Thanh toán 4.190.000đ cho hóa đơn HD-2024-0088 đã được xác nhận.",
            "payment", "1 tuần trước", true),

        new NotificationDTO(6L,
            "Diễn tập phòng cháy - 30/06",
            "Diễn tập phòng cháy chữa cháy bắt buộc tại Tòa B lúc 14:00 ngày 30/06/2024.",
            "announcement", "1 tuần trước", true)
    );

    @Override
    public List<NotificationDTO> getAllNotifications() {
        return NOTIFICATIONS;
    }

    @Override
    public List<NotificationDTO> getNotificationsByType(String type) {
        if (type == null || type.isBlank()) {
            return getAllNotifications();
        }
        return NOTIFICATIONS.stream()
                .filter(n -> n.getType().equalsIgnoreCase(type))
                .collect(Collectors.toList());
    }

    @Override
    public long countUnread() {
        return NOTIFICATIONS.stream()
                .filter(n -> !n.isRead())
                .count();
    }
}
