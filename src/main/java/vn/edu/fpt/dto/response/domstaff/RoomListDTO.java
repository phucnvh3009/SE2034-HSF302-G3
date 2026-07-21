package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomListDTO {
    private Long id;
    private String buildingName;
    private String floor;
    private String roomNumber;      // Số phòng (VD: 101)
    private String typeName;        // Loại phòng (VD: Phòng 4 người)
    private Integer currentOccupancy; // Số người hiện tại
    private Integer maxBeds;        // Sức chứa tối đa
    private String status;          // Trạng thái (AVAILABLE, FULL, MAINTENANCE)
}
