package vn.edu.fpt.controller.dom_manager;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.edu.fpt.dto.response.StaffListResponse;
import vn.edu.fpt.service.StaffService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import vn.edu.fpt.dto.request.StaffCreateRequest;
import vn.edu.fpt.service.FloorService;
import vn.edu.fpt.model.Floor;

import java.util.List;

@Controller
@RequestMapping("/dom-manager/staff")
@RequiredArgsConstructor
public class DomManagerStaffController {

    private final StaffService staffService;
    private final FloorService floorService;

    @GetMapping
    public String showStaffList(Model model) {
        // Mock logged in manager (Manager of Building A)
        Long loggedInManagerId = 2L;
        
        List<StaffListResponse> staffs = staffService.getStaffsByManagerId(loggedInManagerId);
        model.addAttribute("staffs", staffs);
        return "dom_manager/staff/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        Long loggedInManagerId = 2L;
        
        List<Floor> floors = floorService.getFloorsByManagerId(loggedInManagerId);
        model.addAttribute("floors", floors);
        model.addAttribute("staff", new StaffCreateRequest());
        
        return "dom_manager/staff/create";
    }

    @PostMapping("/create")
    public String createStaff(@Valid @ModelAttribute("staff") StaffCreateRequest request,
                              BindingResult result,
                              Model model) {
        Long loggedInManagerId = 2L;
        
        if (result.hasErrors()) {
            List<Floor> floors = floorService.getFloorsByManagerId(loggedInManagerId);
            model.addAttribute("floors", floors);
            return "dom_manager/staff/create";
        }
        
        staffService.createStaff(request, loggedInManagerId);
        return "redirect:/dom-manager/staff";
    }
}
