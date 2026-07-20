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

    @GetMapping("/")
    public String indexRedirect() {
        return "redirect:/login";
    }

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
        return "auth/login";
    }

    @PostMapping("/login")
    public String loginProcess(@Valid @ModelAttribute("loginRequest") LoginRequest request,
                               BindingResult bindingResult,
                               HttpSession session,
                               Model model) {
        if (bindingResult.hasErrors()) {
            return "auth/login";
        }

        Optional<User> userOpt = userRepository.findByEmail(request.getEmail());
        if (userOpt.isEmpty()) {
            model.addAttribute("errorMessage", "Email đăng nhập không tồn tại!");
            return "auth/login";
        }
        User user = userOpt.get();

        if (!user.getPasswordHash().equals(request.getPassword())) {
            model.addAttribute("errorMessage", "Mật khẩu không chính xác!");
            return "auth/login";
        }

        if (user.getIsActive() == null || !user.getIsActive()) {
            model.addAttribute("errorMessage", "Tài khoản của bạn đã bị khóa. Vui lòng liên hệ Admin!");
            return "auth/login";
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
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_ADMIN || ur.getRole().getRoleName() == RoleName.ADMIN);
        boolean isManager = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_MANAGER || ur.getRole().getRoleName() == RoleName.MANAGER);
        boolean isStudent = user.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_STUDENT || ur.getRole().getRoleName() == RoleName.STUDENT);

        if (isAdmin) {
            return "redirect:/admin/managers";
        } else if (isManager) {
            return "redirect:/manager/dashboard";
        } else if (isStudent) {
            return "redirect:/student/dashboard";
        }

        return "redirect:/login";
    }
}
