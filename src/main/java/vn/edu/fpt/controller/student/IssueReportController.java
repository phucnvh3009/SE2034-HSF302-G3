package vn.edu.fpt.controller.student;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.dto.IssueReportDTO;
import vn.edu.fpt.model.User;
import vn.edu.fpt.service.IssueReportService;

import java.util.List;

@Controller
@RequestMapping("/student/reports")
@RequiredArgsConstructor
public class IssueReportController {

    private final IssueReportService reportService;

    /**
     * GET /student/reports -> Hiển thị danh sách báo cáo sự cố
     */
    @GetMapping
    public String listReports(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        List<IssueReportDTO> reports = reportService.getReportsByStudent(currentUser.getId());
        model.addAttribute("reports", reports);
        model.addAttribute("userDisplayName", currentUser.getFullName());

        return "views/report/list";
    }

   // form tạo báo cáo sự cố
    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("userDisplayName", currentUser.getFullName());
        return "views/report/create";
    }

    //Xử lý gửi báo cáo
    @PostMapping("/create")
    public String submitReport(@RequestParam String title,
                               @RequestParam String description,
                               @RequestParam String category,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        try {
            reportService.createReport(currentUser.getId(), title, description, category);
            redirectAttributes.addFlashAttribute("successMessage", "Gửi báo cáo sự cố thành công!");
            return "redirect:/student/reports";
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/student/reports/create";
        }
    }
}
