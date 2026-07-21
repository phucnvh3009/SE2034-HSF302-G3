package vn.edu.fpt.dto.response;

import lombok.Data;
import java.util.List;

@Data
public class OccupancyDTO {
    private Long buildingId;
    private String buildingName;
    private int totalRooms;
    private int totalBeds;
    private int occupiedBeds;
    private int availableBeds;
    private int maintenanceBeds;

    private List<FloorOccupancy> floors;

    @Data
    public static class FloorOccupancy {
        private String floorNumber;
        private int totalRooms;
        private int totalBeds;
        private int occupiedBeds;
        private int availableBeds;
        private int maintenanceBeds;
        private List<RoomOccupancy> rooms;
    }

    @Data
    public static class RoomOccupancy {
        private String roomName;
        private int capacity;
        private int occupiedBeds;
        private int availableBeds;
        private int maintenanceBeds;
        private String status; // e.g. AVAILABLE, FULL, MAINTENANCE
    }
}
