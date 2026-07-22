package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.NotificationCategory;
import vn.edu.fpt.model.constant.NotificationTarget;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Notification4StaffDto {
    private String title;
    private NotificationCategory category;
    private NotificationTarget targetType;
    private Long targetBuildingId;
    private String studentCode;
    private String content;
}
