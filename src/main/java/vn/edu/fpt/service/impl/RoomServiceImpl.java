package vn.edu.fpt.service.impl;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.response.domstaff.RoomDetailDTO;
import vn.edu.fpt.dto.response.domstaff.RoomListDTO;
import vn.edu.fpt.model.Bed;
import vn.edu.fpt.model.Contract;
import vn.edu.fpt.model.Room;
import vn.edu.fpt.model.constant.RoomStatus;
import vn.edu.fpt.repository.RoomRepository;
import vn.edu.fpt.service.RoomService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.edu.fpt.repository.ContractRepository;

@Service
@Transactional
@AllArgsConstructor
public class RoomServiceImpl implements RoomService {
    private RoomRepository roomRepository;
    private ContractRepository contractRepository;
    @Override
    public Page<RoomListDTO> getAllRooms(String keyword, RoomStatus status, int pageNo, int pageSize) {
        List<RoomListDTO> roomListDTOs = new ArrayList<>();
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        Page<Room> roomPage = roomRepository.searchAndFilterRooms(keyword, status, pageable);
        for (Room room : roomPage.getContent()) {
            roomListDTOs.add(new RoomListDTO(
                    room.getId(),
                    room.getFloor().getBuilding().getName(),
                    "Tầng " + room.getFloor().getFloorNumber().toString(),
                    room.getRoomNumber(),
                    room.getRoomType().getTypeName(),
                    room.getCurrentOccupancy(),
                    room.getMaxBeds(),
                    room.getStatus().name()
            ));
        }
        return new PageImpl<>(roomListDTOs, pageable, roomPage.getTotalElements());
    }

    @Override
    public RoomDetailDTO getRoomDetailById(Long id) {
        Room room = roomRepository.findById(id).orElseThrow(() -> new RuntimeException("Không tìm thấy phòng"));
        
        List<Contract> activeContracts = contractRepository.findActiveContractsByRoomId(id);
        
        List<RoomDetailDTO.BedInfoDTO> bedInfos = new ArrayList<>();
        
        List<Bed> sortedBeds = new ArrayList<>(room.getBeds());
        sortedBeds.sort((b1, b2) -> b1.getBedNumber().compareTo(b2.getBedNumber()));
        
        for (Bed bed : sortedBeds) {
            Contract bedContract = activeContracts.stream()
                    .filter(c -> c.getBed().getId().equals(bed.getId()))
                    .findFirst()
                    .orElse(null);
                    
            if (bedContract != null) {
                String studentName = bedContract.getStudent().getLastName() + " " + bedContract.getStudent().getFirstName();
                String studentCode = bedContract.getStudent().getStudentProfile() != null 
                        ? bedContract.getStudent().getStudentProfile().getStudentCode() : "";
                        
                bedInfos.add(new RoomDetailDTO.BedInfoDTO(
                        "Giường " + bed.getBedNumber(),
                        studentName,
                        studentCode,
                        "Đang hiệu lực",
                        true
                ));
            } else {
                bedInfos.add(new RoomDetailDTO.BedInfoDTO(
                        "Giường " + bed.getBedNumber(),
                        null, null, null, false
                ));
            }
        }
        
        String statusBadgeText = room.getStatus().name().equals("MAINTENANCE") ? "Bảo trì" : 
                                 (room.getCurrentOccupancy() >= room.getMaxBeds() ? "Đã đầy" : "Còn trống");
        String occupancyStr = statusBadgeText + " (" + room.getCurrentOccupancy() + "/" + room.getMaxBeds() + ")";
                
        return new RoomDetailDTO(
                room.getFloor().getBuilding().getName(),
                "Tầng " + room.getFloor().getFloorNumber(),
                room.getRoomNumber(),
                room.getRoomType().getTypeName(),
                room.getStatus().name(),
                occupancyStr,
                bedInfos
        );
    }
}
