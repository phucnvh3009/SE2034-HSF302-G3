package vn.edu.fpt.controller.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.edu.fpt.dto.request.ManagerRequest;
import vn.edu.fpt.dto.response.ManagerDTO;
import vn.edu.fpt.service.DormManagerService;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminManagerController {

    private final DormManagerService dormManagerService;

    @GetMapping("/managers")
    public String showManagersList(Model model) {
        List<ManagerDTO> managers = dormManagerService.getAllManagers();
        model.addAttribute("managers", managers);

        if (!model.containsAttribute("newManager")) {
            model.addAttribute("newManager", new ManagerRequest());
        }

        return "admin/managers";
    }

    @GetMapping("/{id}")
    public String showManagerDetail(@PathVariable("id") Long id, Model model) {
        try {
            ManagerDTO manager = dormManagerService.getManagerById(id);
            model.addAttribute("manager", manager);

            return "admin/informationManager";
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());

            return "redirect:/admin/managers";
        }
    }

}
