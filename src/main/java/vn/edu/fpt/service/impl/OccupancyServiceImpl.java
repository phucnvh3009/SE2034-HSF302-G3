package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.dto.response.OccupancyDTO;
import vn.edu.fpt.model.Bed;
import vn.edu.fpt.model.DormitoryBuilding;
import vn.edu.fpt.model.Floor;
import vn.edu.fpt.model.Room;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.BedStatus;
import vn.edu.fpt.repository.DormitoryBuildingRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.OccupancyService;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OccupancyServiceImpl implements OccupancyService {

    private final DormitoryBuildingRepository buildingRepository;
    private final UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public OccupancyDTO getOccupancyByManagerId(Long managerId) {
        User manager = userRepository.findById(managerId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy quản lý."));
        DormitoryBuilding building = manager.getBuilding();
        if (building == null) {
            throw new IllegalArgumentException("Không tìm thấy tòa nhà do quản lý này phụ trách.");
        }

        OccupancyDTO dto = new OccupancyDTO();
        dto.setBuildingId(building.getId());
        dto.setBuildingName(building.getName());

        int totalRooms = 0;
        int totalBeds = 0;
        int occupiedBeds = 0;
        int availableBeds = 0;
        int maintenanceBeds = 0;

        List<OccupancyDTO.FloorOccupancy> floorDTOs = new ArrayList<>();

        for (Floor floor : building.getFloors()) {
            OccupancyDTO.FloorOccupancy floorDTO = new OccupancyDTO.FloorOccupancy();
            floorDTO.setFloorNumber(String.valueOf(floor.getFloorNumber()));

            int fRooms = 0;
            int fBeds = 0;
            int fOccupied = 0;
            int fAvailable = 0;
            int fMaintenance = 0;

            List<OccupancyDTO.RoomOccupancy> roomDTOs = new ArrayList<>();

            for (Room room : floor.getRooms()) {
                fRooms++;
                OccupancyDTO.RoomOccupancy rDTO = new OccupancyDTO.RoomOccupancy();
                rDTO.setRoomName(room.getRoomNumber());
                rDTO.setCapacity(room.getMaxBeds());
                
                int rOccupied = 0;
                int rAvailable = 0;
                int rMaintenance = 0;

                for (Bed bed : room.getBeds()) {
                    fBeds++;
                    if (bed.getStatus() == BedStatus.OCCUPIED) {
                        fOccupied++;
                        rOccupied++;
                    } else if (bed.getStatus() == BedStatus.AVAILABLE) {
                        fAvailable++;
                        rAvailable++;
                    } else if (bed.getStatus() == BedStatus.MAINTENANCE) {
                        fMaintenance++;
                        rMaintenance++;
                    }
                }
                
                rDTO.setOccupiedBeds(rOccupied);
                rDTO.setAvailableBeds(rAvailable);
                rDTO.setMaintenanceBeds(rMaintenance);
                
                if (rAvailable > 0) {
                    rDTO.setStatus("AVAILABLE");
                } else if (rMaintenance == room.getMaxBeds()) {
                    rDTO.setStatus("MAINTENANCE");
                } else {
                    rDTO.setStatus("FULL");
                }
                
                roomDTOs.add(rDTO);
            }

            floorDTO.setTotalRooms(fRooms);
            floorDTO.setTotalBeds(fBeds);
            floorDTO.setOccupiedBeds(fOccupied);
            floorDTO.setAvailableBeds(fAvailable);
            floorDTO.setMaintenanceBeds(fMaintenance);
            roomDTOs.sort(java.util.Comparator.comparing(vn.edu.fpt.dto.response.OccupancyDTO.RoomOccupancy::getRoomName));
            floorDTO.setRooms(roomDTOs);
            floorDTOs.add(floorDTO);

            totalRooms += fRooms;
            totalBeds += fBeds;
            occupiedBeds += fOccupied;
            availableBeds += fAvailable;
            maintenanceBeds += fMaintenance;
        }

        floorDTOs.sort(java.util.Comparator.comparing(f -> Integer.parseInt(f.getFloorNumber())));

        dto.setTotalRooms(totalRooms);
        dto.setTotalBeds(totalBeds);
        dto.setOccupiedBeds(occupiedBeds);
        dto.setAvailableBeds(availableBeds);
        dto.setMaintenanceBeds(maintenanceBeds);
        dto.setFloors(floorDTOs);

        return dto;
    }
}
