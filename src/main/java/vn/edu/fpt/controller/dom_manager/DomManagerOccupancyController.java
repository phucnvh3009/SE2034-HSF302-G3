package vn.edu.fpt.controller.dom_manager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dom-manager/occupancy")
public class DomManagerOccupancyController {

    @GetMapping
    public String showOccupancy(Model model) {
        return "dom_manager/occupancy/index";
    }
}
