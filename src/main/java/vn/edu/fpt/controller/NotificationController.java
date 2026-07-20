package vn.edu.fpt.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.edu.fpt.dto.NotificationDTO;
import vn.edu.fpt.model.User;
import vn.edu.fpt.service.NotificationService;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NotificationController {

    private final NotificationService notificationService;

    /**
     * GET /notifications          → hiển thị tất cả thông báo
     */
    @GetMapping("/notifications")
    public String index(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        List<NotificationDTO> notifications = notificationService.getAllNotifications();

        model.addAttribute("notifications", notifications);
        model.addAttribute("unreadCount", notificationService.countUnread());
        model.addAttribute("userDisplayName", currentUser.getFullName());

        return "notification/index";
    }
}
