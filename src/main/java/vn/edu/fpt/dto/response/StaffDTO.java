package vn.edu.fpt.dto.response;

import lombok.Data;
import vn.edu.fpt.model.constant.GenderType;
import java.time.Instant;
import java.time.LocalDate;

@Data
public class StaffDTO {

    private Long id;
    private String email;
    private String fullName;
    private String phone;
    private GenderType gender;
    private LocalDate dob;
    private String avatar;
    private Boolean isActive;
    private Instant createdAt;

}
