package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UtilityUsageListDTO {
    private Long id;
    private String roomNumber;
    private String monthYear; // VD: "Tháng 06/2026"
    private Integer startElectricity;
    private Integer endElectricity;
    private Integer electricityUsage; // = end - start
    private Integer startWater;
    private Integer endWater;
    private Integer waterUsage; // = end - start
}
