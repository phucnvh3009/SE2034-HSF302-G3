package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.NotificationCategory;
import vn.edu.fpt.model.constant.NotificationTarget;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Notification4StaffDto {

    @NotBlank(message = "Tiêu đề không được để trống")
    private String title;

    @NotNull(message = "Vui lòng chọn loại thông báo")
    private NotificationCategory category;

    @NotNull(message = "Vui lòng chọn đối tượng nhận thông báo")
    private NotificationTarget targetType;

    private Long targetBuildingId;
    private String studentCode;

    @NotBlank(message = "Nội dung không được để trống")
    private String content;
}
