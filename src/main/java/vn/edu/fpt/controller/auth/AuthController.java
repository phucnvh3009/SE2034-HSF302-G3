package vn.edu.fpt.controller.auth;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.dto.request.LoginRequest;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.RoleName;
import vn.edu.fpt.repository.UserRepository;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Transactional
public class AuthController {

    private final UserRepository userRepository;

    @GetMapping("/login")
    public String showLoginForm(Model model, HttpSession session) {

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null) {
            String redirectUrl = getRedirectUrlForUser(currentUser);
            if (!redirectUrl.equals("redirect:/login")) {
                return redirectUrl;
            }
        }

        if (!model.containsAttribute("loginRequest")) {
            model.addAttribute("loginRequest", new LoginRequest());
        }
        return "views/auth/login";
    }

    @PostMapping("/login")
    public String loginProcess(@Valid @ModelAttribute("loginRequest") LoginRequest request,
                               BindingResult bindingResult,
                               HttpSession session,
                               Model model) {
        if (bindingResult.hasErrors()) {
            return "views/auth/login";
        }

        Optional<User> userOpt = userRepository.findByEmail(request.getEmail());
        if (userOpt.isEmpty()) {
            model.addAttribute("errorMessage", "Email đăng nhập không tồn tại!");
            return "views/auth/login";
        }

        User user = userOpt.get();

        if (!user.getPasswordHash().equals(request.getPassword())) {
            model.addAttribute("errorMessage", "Mật khẩu không chính xác!");

            return "views/auth/login";
        }

        if (user.getIsActive() == null || !user.getIsActive()) {
            model.addAttribute("errorMessage", "Tài khoản của bạn đã bị khóa. Vui lòng liên hệ Admin!");
            return "views/auth/login";
        }

        session.setAttribute("currentUser", user);
        return getRedirectUrlForUser(user);
    }

    @GetMapping("/logout")
    public String logoutProcess(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout";
    }

    private String getRedirectUrlForUser(User user) {
        boolean isAdmin = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_ADMIN);
        boolean isManager = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_MANAGER);
        boolean isStaff = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_STAFF);
        boolean isStudent = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_STUDENT);

        if (isAdmin) {
            return "redirect:/admin/listManager";
        } else if (isManager) {
            return "redirect:/manager/dashboard";
        } else if (isStaff) {
            return "redirect:/domstaff/reports";
        } else if (isStudent) {
            return "redirect:/student/dashboard";
        }

        return "redirect:/login";
    }
}
