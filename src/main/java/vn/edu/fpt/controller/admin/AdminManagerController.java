package vn.edu.fpt.controller.admin;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.dto.request.ManagerRequest;
import vn.edu.fpt.dto.response.ManagerDTO;
import vn.edu.fpt.service.DormManagementService;

import java.util.List;

@Controller
@RequestMapping("/admin/listManager")
@RequiredArgsConstructor
public class AdminManagerController {

    private final DormManagementService dormManagementService;

    @GetMapping
    public String showManagersList(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "status", required = false) Boolean status,
            Model model) {

        List<ManagerDTO> managers = dormManagementService.searchManagers(keyword, status);
        model.addAttribute("managers", managers);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);

        return "views/admin/listManager";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        if (!model.containsAttribute("newManager")) {
            model.addAttribute("newManager", new ManagerRequest());
        }
        return "views/admin/addManager";
    }

    @PostMapping
    public String createManager(@Valid @ModelAttribute("newManager") ManagerRequest request,
                                BindingResult bindingResult,
                                Model model,
                                RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errorMessage", "Thông tin nhập vào không hợp lệ. Vui lòng kiểm tra lại!");
            return "views/admin/addManager";
        }

        try {
            dormManagementService.createManager(request);
            redirectAttributes.addFlashAttribute("successMessage", "Thêm mới quản lý thành công!");
            return "redirect:/admin/listManager";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "views/admin/addManager";
        }
    }

    @GetMapping("/{id}")
    public String showManagerDetail(@PathVariable("id") Long id, Model model) {
        try {
            ManagerDTO manager = dormManagementService.getManagerById(id);
            model.addAttribute("manager", manager);
            return "views/admin/viewManager";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "redirect:/admin/listManager";
        }
    }

    @PostMapping("/{id}/status")
    public String toggleManagerStatus(@PathVariable("id") Long id,
                                      @RequestParam(value = "redirectDetail", defaultValue = "false") boolean redirectDetail,
                                      RedirectAttributes redirectAttributes) {
        try {
            dormManagementService.toggleManagerStatus(id);
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật trạng thái tài khoản thành công!");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }

        if (redirectDetail) {
            return "redirect:/admin/listManager/" + id;
        }
        return "redirect:/admin/listManager";
    }
}
