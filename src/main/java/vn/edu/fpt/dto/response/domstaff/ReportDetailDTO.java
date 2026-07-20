package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReportDetailDTO {
    private String id;
    private String studentName;
    private String studentCode;
    private String createdAt; // Sẽ format sẵn ngày gửi dưới dạng String (VD: 20/07/2026 14:30)
    private String reportType;
    private String title;
    private String description;
    private String staffNote;
    private String reportStatus;
}
