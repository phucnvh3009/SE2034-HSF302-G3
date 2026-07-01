package vn.edu.fpt.controller.dom_manager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dom-manager/dashboard")
public class DomManagerDashboardController {

    @GetMapping
    public String showDashboard(Model model) {
        return "dom_manager/dashboard/index";
    }
}
