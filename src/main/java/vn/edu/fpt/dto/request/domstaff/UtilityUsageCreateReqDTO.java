package vn.edu.fpt.dto.request.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UtilityUsageCreateReqDTO {
    private String monthYear; // "2026-06"
    private Long roomId;
    private Integer endElectricity;
    private Integer endWater;
    private String note;
}
