package vn.edu.fpt.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import vn.edu.fpt.model.constant.GenderType;

import java.time.LocalDate;

@Getter
@Setter
public class ManagerRequest {

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không đúng định dạng")
    private String email;

    @NotBlank(message = "Mật khẩu không được để trống")
    private String password;

    @NotBlank(message = "Tên không được để trống")
    private String firstName;

    private String middleName;

    @NotBlank(message = "Họ không được để trống")
    private String lastName;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^(0|\\+84)[3|5|7|8|9][0-9]{8}$", message = "Số điện thoại không đúng định dạng")
    private String phone;

    @NotNull(message = "Giới tính không được để trống")
    private GenderType gender;

    @NotNull(message = "Ngày sinh không được để trống")
    private LocalDate dob;

}
