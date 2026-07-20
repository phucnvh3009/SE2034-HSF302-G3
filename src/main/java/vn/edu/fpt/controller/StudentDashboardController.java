package vn.edu.fpt.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.edu.fpt.model.User;

@Controller
@RequestMapping("/student/dashboard")
@RequiredArgsConstructor
public class StudentDashboardController {

    @GetMapping
    public String dashboard(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("userDisplayName", currentUser.getFullName());
        model.addAttribute("email", currentUser.getEmail());
        model.addAttribute("phone", currentUser.getPhone());

        return "student/dashboard/index";
    }
}
