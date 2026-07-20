package vn.edu.fpt.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NotificationDTO {

    private Long id;
    private String title;       // Tiêu đề thông báo
    private String content;     // Nội dung ngắn
    private String type;        // payment | announcement | maintenance | system
    private String timeAgo;     // "2 giờ trước", "Hôm qua"...
    private boolean read;       // Đã đọc hay chưa
}
