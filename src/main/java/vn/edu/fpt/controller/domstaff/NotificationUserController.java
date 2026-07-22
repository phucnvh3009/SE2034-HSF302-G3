package vn.edu.fpt.controller.domstaff;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.dto.response.domstaff.Notification4StaffDto;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.NotificationCategory;
import vn.edu.fpt.model.constant.NotificationTarget;
import vn.edu.fpt.service.NotificationService;

@Controller
@RequestMapping("/domstaff")
@AllArgsConstructor
public class NotificationUserController {
    private NotificationService notificationService;
    @GetMapping("/notifications")
    public String listNotifications(Model model,HttpSession session) {
        User currentStaff = (User) session.getAttribute("currentUser");
        if (currentStaff == null) {
            return "redirect:/login";
        }
        Notification4StaffDto dto = new Notification4StaffDto();
        dto.setTargetBuildingId(currentStaff.getBuilding().getId());
        model.addAttribute("notificationDTO", dto);
        return "views/domstaff/notification/NotificationCreate";
    }

    @PostMapping("/notifications/create")
    public String createNotification(
            @ModelAttribute Notification4StaffDto notificationDTO,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        User currentStaff = (User) session.getAttribute("currentUser");
        if (currentStaff == null) {
            return "redirect:/login";
        }
        try {
            // Quăng cả cái DTO (đã chứa đủ dữ liệu) xuống cho Service
            notificationService.sendNotification(notificationDTO, currentStaff);
            redirectAttributes.addFlashAttribute("success", "Đã gửi thông báo thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Lỗi: " + e.getMessage());
        }
        return "redirect:/domstaff/notifications";
    }
}
