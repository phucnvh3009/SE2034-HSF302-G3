package vn.edu.fpt.controller.manager;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.edu.fpt.dto.response.OccupancyDTO;
import vn.edu.fpt.service.OccupancyService;

@Controller
@RequestMapping("/dom_manager/occupancy")
@RequiredArgsConstructor
public class ManagerOccupancyController {

    private final OccupancyService occupancyService;

    @GetMapping
    public String showOccupancyStatus(Model model, jakarta.servlet.http.HttpSession session) {
        vn.edu.fpt.model.User currentUser = (vn.edu.fpt.model.User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }
        Long currentManagerId = currentUser.getId();
        
        try {
            OccupancyDTO occupancy = occupancyService.getOccupancyByManagerId(currentManagerId);
            model.addAttribute("occupancy", occupancy);
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
        }

        return "dom_manager/occupancy/list";
    }
}
