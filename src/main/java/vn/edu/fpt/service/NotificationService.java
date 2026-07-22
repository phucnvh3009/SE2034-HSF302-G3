package vn.edu.fpt.service;

import vn.edu.fpt.dto.NotificationDTO;
import vn.edu.fpt.dto.response.domstaff.Notification4StaffDto;
import vn.edu.fpt.model.User;

import java.util.List;

public interface NotificationService {

    List<NotificationDTO> getAllNotifications();

    List<NotificationDTO> getNotificationsByType(String type);
    void sendNotification(Notification4StaffDto dto, User sender);
    long countUnread();
}
