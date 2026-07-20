package vn.edu.fpt.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IssueReportDTO {

    private Long id;
    private String title;
    private String description;
    private String category;
    private String categoryName;
    private String status;
    private String statusName;
    private String staffNote;
    private String roomName;
    private String createdAt;
}
