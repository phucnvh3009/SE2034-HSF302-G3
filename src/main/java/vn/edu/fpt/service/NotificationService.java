package vn.edu.fpt.service;

import vn.edu.fpt.dto.NotificationDTO;

import java.util.List;

public interface NotificationService {

    List<NotificationDTO> getAllNotifications();

    List<NotificationDTO> getNotificationsByType(String type);

    long countUnread();
}
