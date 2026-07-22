package vn.edu.fpt.dto.request.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UtilityUsageCreateReqDTO {

    @NotBlank(message = "Tháng năm không được để trống")
    private String monthYear; // "2026-06"

    @NotNull(message = "Vui lòng chọn phòng")
    private Long roomId;

    @NotNull(message = "Chỉ số điện không được để trống")
    @Min(value = 0, message = "Chỉ số điện không được âm")
    private Integer endElectricity;

    @NotNull(message = "Chỉ số nước không được để trống")
    @Min(value = 0, message = "Chỉ số nước không được âm")
    private Integer endWater;

    private String note;
}
