package vn.edu.fpt.controller.domstaff;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.dto.request.domstaff.UtilityUsageCreateReqDTO;
import vn.edu.fpt.dto.response.domstaff.UtilityUsageListDTO;
import vn.edu.fpt.model.User;
import vn.edu.fpt.service.RoomService;
import vn.edu.fpt.service.UtilityUsageService;

import java.util.List;

@Controller
@RequestMapping("/domstaff/utility-usage")
@AllArgsConstructor
public class UtilityUsageController {

    private final UtilityUsageService utilityUsageService;
    private final RoomService roomService;

    @GetMapping
    public String listUtilityUsages(Model model, HttpSession session) {
        User currentStaff = (User) session.getAttribute("currentUser");
        if (currentStaff == null) {
            return "redirect:/login";
        }
        List<UtilityUsageListDTO> usages = utilityUsageService.getAllUtilityUsages(currentStaff.getBuilding().getId());
        model.addAttribute("usages", usages);
        return "views/domstaff/UtilityUsageList";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model, HttpSession session) {
        User currentStaff = (User) session.getAttribute("currentUser");
        if (currentStaff == null) {
            return "redirect:/login";
        }
        model.addAttribute("rooms", roomService.getAllRoomsByBuildingId(currentStaff.getBuilding().getId()));
        model.addAttribute("reqDTO", new UtilityUsageCreateReqDTO());
        return "views/domstaff/UtilityUsageCreate";
    }

    @PostMapping("/create")
    public String submitCreateForm(@ModelAttribute("reqDTO") UtilityUsageCreateReqDTO reqDTO, 
                                   RedirectAttributes redirectAttributes,HttpSession session) {
        User currentStaff = (User) session.getAttribute("currentUser");
        if (currentStaff == null) {
            return "redirect:/login";
        }
        try {
            utilityUsageService.createUtilityUsage(reqDTO,currentStaff);
            redirectAttributes.addFlashAttribute("successMessage", "Ghi nhận chỉ số điện nước thành công!");
            return "redirect:/domstaff/utility-usage";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/domstaff/utility-usage/create";
        }
    }
}
