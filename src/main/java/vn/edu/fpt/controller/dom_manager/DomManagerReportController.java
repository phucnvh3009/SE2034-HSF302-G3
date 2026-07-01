package vn.edu.fpt.controller.dom_manager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dom-manager/report")
public class DomManagerReportController {

    @GetMapping
    public String showReport(Model model) {
        return "dom_manager/report/index";
    }
}
