package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.model.Notification;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
}
