package vn.edu.fpt.controller.dom_manager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dom-manager/assignment")
public class DomManagerAssignmentController {

    @GetMapping
    public String showAssignment(Model model) {
        return "dom_manager/assignment/index";
    }
}
