package vn.edu.fpt.controller.manager;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.dto.request.StaffRequest;
import vn.edu.fpt.dto.response.StaffDTO;
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
                                Model model) {
        List<StaffDTO> staffs = dormStaffService.getAllStaffs(keyword, status);
        model.addAttribute("staffs", staffs);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);

        return "dom_manager/staff_account/list";
    }

    @GetMapping("/{id}")
    public String showStaffDetail(@PathVariable("id") Long id, Model model) {
        try {
            StaffDTO staff = dormStaffService.getStaffById(id);
            model.addAttribute("staff", staff);
            return "dom_manager/staff_account/view";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "redirect:/dom_manager/staff_account";
        }
    }

    @GetMapping("/add")
    public String showAddStaffForm(Model model) {
        model.addAttribute("staffRequest", new StaffRequest());
        return "dom_manager/staff_account/add";
    }

    @PostMapping("/add")
    public String addStaff(@Valid @ModelAttribute("staffRequest") StaffRequest staffRequest,
                           BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "dom_manager/staff_account/add";
        }
        try {
            dormStaffService.createStaff(staffRequest);
            model.addAttribute("successMessage", "Thêm nhân viên thành công");
            return "redirect:/dom_manager/staff_account";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "dom_manager/staff_account/add";
        }
    }

    @PostMapping("/{id}/status")
    public String toggleStaffStatus(@PathVariable("id") Long id) {
        dormStaffService.toggleStaffStatus(id);
        return "redirect:/dom_manager/staff_account";
    }
}
