package vn.edu.fpt.controller.manager;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import vn.edu.fpt.dto.request.StaffRequest;
import vn.edu.fpt.dto.response.StaffDTO;
import vn.edu.fpt.model.User;
import vn.edu.fpt.service.DormStaffService;
import jakarta.validation.Valid;

import java.util.List;

@Controller
@RequestMapping("/dom_manager/staff_account")
@RequiredArgsConstructor
public class ManagerStaffController {

    private final DormStaffService dormStaffService;

    @GetMapping
    public String showStaffList(@RequestParam(required = false) String keyword,
                                @RequestParam(required = false) Boolean status,
                                HttpSession session,
                                Model model) {
        User currentUser = (User) session.getAttribute("currentUser");
        Long buildingId = (currentUser != null && currentUser.getBuilding() != null) ? currentUser.getBuilding().getId() : null;
        
        List<StaffDTO> staffs = dormStaffService.getAllStaffsByBuildingId(buildingId, keyword, status);
        model.addAttribute("staffs", staffs);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);

        return "views/dom_manager/staff_account/list";
    }

    @GetMapping("/{id}")
    public String showStaffDetail(@PathVariable("id") Long id, Model model) {
        try {
            StaffDTO staff = dormStaffService.getStaffById(id);
            model.addAttribute("staff", staff);
            return "views/dom_manager/staff_account/view";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "redirect:/dom_manager/staff_account";
        }
    }

    @GetMapping("/add")
    public String showAddStaffForm(Model model) {
        model.addAttribute("staffRequest", new StaffRequest());
        return "views/dom_manager/staff_account/add";
    }

    @PostMapping("/add")
    public String addStaff(@Valid @ModelAttribute("staffRequest") StaffRequest staffRequest,
                           BindingResult bindingResult, HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            return "views/dom_manager/staff_account/add";
        }
        try {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null) {
                return "redirect:/login";
            }
            dormStaffService.createStaff(currentUser.getId(), staffRequest);
            model.addAttribute("successMessage", "Thêm nhân viên thành công");
            return "redirect:/dom_manager/staff_account";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "views/dom_manager/staff_account/add";
        }
    }

    @PostMapping("/{id}/status")
    public String toggleStaffStatus(@PathVariable("id") Long id) {
        dormStaffService.toggleStaffStatus(id);
        return "redirect:/dom_manager/staff_account";
    }
}
