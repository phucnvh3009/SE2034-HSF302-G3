package vn.edu.fpt.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.RoleName;

@Component
public class DomManagerAuthInterceptor implements HandlerInterceptor {

    // Phương thức preHandle sẽ chạy TRƯỚC KHI request đi tới Controller
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1. Lấy Session hiện tại của người dùng
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // 2. Kiểm tra xem người dùng đã đăng nhập chưa (có tồn tại User trong Session không)
        if (currentUser == null) {
            // Nếu chưa đăng nhập, đá văng về trang Đăng nhập (/login)
            response.sendRedirect(request.getContextPath() + "/login");
            // Trả về false để chặn luồng request, không cho đi tiếp vào Controller
            return false;
        }

        // 3. Nếu đã đăng nhập, kiểm tra xem người này có quyền Quản lý (ROLE_MANAGER) hay không
        // Duyệt qua danh sách các Role của User xem có Role nào khớp với ROLE_MANAGER không
        boolean isManager = currentUser.getUserRoles().stream()
                .anyMatch(ur -> ur.getRole().getRoleName() == RoleName.ROLE_MANAGER);

        // 4. Nếu không có quyền Quản lý
        if (!isManager) {
            // Đá văng về trang Đăng nhập (hoặc bạn có thể đổi thành trang lỗi 403 Access Denied)
            response.sendRedirect(request.getContextPath() + "/login");
            // Chặn không cho truy cập tiếp
            return false;
        }

        // 5. Trả về true nếu qua được hết các chướng ngại vật trên -> Cho phép request đi tiếp vào Controller
        return true;
    }
}
