package vn.edu.fpt.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomCardDTO {

    private Long roomId;
    private String roomNumber;        // Số phòng: "501"
    private String buildingName;      // Tên tòa: "Tòa B"
    private Integer floorNumber;      // Tầng: 5
    private String roomTypeName;      // Loại phòng
    private String description;       // Mô tả tiện ích
    private BigDecimal pricePerMonth; // Giá mỗi tháng
    private long availableBeds;       // Số giường còn trống
}
