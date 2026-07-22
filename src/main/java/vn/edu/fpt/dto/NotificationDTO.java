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
    private String title;
    private String content;
    private String type;
    private String timeAgo;
    private boolean read;
}
