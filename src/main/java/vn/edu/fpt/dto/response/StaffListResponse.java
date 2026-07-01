package vn.edu.fpt.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StaffListResponse {
    private Long id;
    private String fullName;
    private String email;
    private String phone;
    private String gender;
    private Boolean isActive;
}
