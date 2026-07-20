package vn.edu.fpt.dto.response.domstaff;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomDetailDTO {
    private String buildingName;
    private String floor;
    private String roomNumber;
    private String typeName;
    private String status;
    private String occupancyStatus; // Ví dụ: "Còn trống (2/4)"
    
    private List<BedInfoDTO> beds;
    
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class BedInfoDTO {
        private String bedName;      // VD: Giường 1
        private String studentName;  // VD: Nguyễn Văn A (hoặc null nếu trống)
        private String studentCode;  // VD: SE150001
        private String contractStatus; // VD: "Đang hiệu lực"
        private boolean isOccupied;  // true/false để HTML hiển thị class màu xám (trống)
    }
}
