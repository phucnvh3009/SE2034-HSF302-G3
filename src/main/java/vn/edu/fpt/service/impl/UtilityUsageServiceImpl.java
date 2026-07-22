package vn.edu.fpt.service.impl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.dto.request.domstaff.UtilityUsageCreateReqDTO;
import vn.edu.fpt.dto.response.domstaff.UtilityUsageListDTO;
import vn.edu.fpt.model.*;
import vn.edu.fpt.model.constant.NotificationCategory;
import vn.edu.fpt.model.constant.NotificationTarget;
import vn.edu.fpt.repository.*;
import vn.edu.fpt.service.NotificationService;
import vn.edu.fpt.service.UtilityUsageService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
@AllArgsConstructor
public class UtilityUsageServiceImpl implements UtilityUsageService {

    private final UtilityUsageRepository utilityUsageRepository;
    private final RoomRepository roomRepository;
    private final SemesterRepository semesterRepository;
    private DormitoryBuildingRepository dormitoryBuildingRepository;
    private NotificationRepository notificationRepository;
    private final ContractRepository contractRepository;
    @Override
    public List<UtilityUsageListDTO> getAllUtilityUsages(Long buildingId) {
        return utilityUsageRepository.findAllWithRoom(buildingId).stream().map(u -> new UtilityUsageListDTO(
                u.getId(),
                u.getRoom().getRoomNumber(),
                "Tháng " + String.format("%02d", u.getRecordedMonth()) + "/" + u.getRecordedYear(),
                u.getStartElectricity(),
                u.getEndElectricity(),
                u.getEndElectricity() - u.getStartElectricity(),
                u.getStartWater(),
                u.getEndWater(),
                u.getEndWater() - u.getStartWater()
        )).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void createUtilityUsage(UtilityUsageCreateReqDTO reqDTO,User sender) {
        Room room = roomRepository.findById(reqDTO.getRoomId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy phòng"));
                
        Semester activeSemester = semesterRepository.findByIsActiveTrue()
                .orElseThrow(() -> new RuntimeException("Không có kỳ học nào đang diễn ra"));

        // Phân tách monthYear (VD: "2026-06")
        String[] parts = reqDTO.getMonthYear().split("-");
        int year = Integer.parseInt(parts[0]);
        int month = Integer.parseInt(parts[1]);

        UtilityUsage existingUsage = utilityUsageRepository.findByRoomIdAndSemesterIdAndRecordedMonthAndRecordedYear(
                reqDTO.getRoomId(), activeSemester.getId(), month, year).orElse(null);

        if (existingUsage != null) {
            throw new IllegalArgumentException("Phòng này đã được ghi chỉ số điện nước trong tháng " + month + "/" + year + " rồi!");
        }

        // Tìm chỉ số của tháng gần nhất (để lấy số điện nước đầu tháng)
        UtilityUsage lastUsage = utilityUsageRepository.findTopByRoomIdOrderByRecordedYearDescRecordedMonthDesc(reqDTO.getRoomId())
                .orElse(null);

        int startElec = lastUsage != null ? lastUsage.getEndElectricity() : 0;
        int startWat = lastUsage != null ? lastUsage.getEndWater() : 0;

        if (reqDTO.getEndElectricity() < startElec) {
            throw new IllegalArgumentException("Chỉ số điện mới (" + reqDTO.getEndElectricity() + ") không được nhỏ hơn chỉ số cũ (" + startElec + ")!");
        }
        if (reqDTO.getEndWater() < startWat) {
            throw new IllegalArgumentException("Chỉ số nước mới (" + reqDTO.getEndWater() + ") không được nhỏ hơn chỉ số cũ (" + startWat + ")!");
        }

        UtilityUsage usageToSave = new UtilityUsage();
        usageToSave.setRoom(room);
        usageToSave.setSemester(activeSemester);
        usageToSave.setRecordedMonth(month);
        usageToSave.setRecordedYear(year);
        usageToSave.setStartElectricity(startElec);
        usageToSave.setEndElectricity(reqDTO.getEndElectricity());
        usageToSave.setStartWater(startWat);
        usageToSave.setEndWater(reqDTO.getEndWater());
        usageToSave.setRecordedAt(LocalDateTime.now());
        // Cập nhật giá trị notification
        List<Contract> contracts = contractRepository.findActiveContractsByRoomId(room.getId());
        DormitoryBuilding dom = room.getFloor().getBuilding();
        
        for (Contract contract : contracts) {
            Notification notification = new Notification();
            notification.setTitle("Cập nhật chỉ số điện nước");
            notification.setCategory(NotificationCategory.USAGE);
            notification.setSender(sender);
            notification.setTargetType(NotificationTarget.STUDENT);
            notification.setTargetBuilding(dom);
            notification.setTargetStudent(contract.getStudent());
            notification.setContent("Chỉ số điện nước của phòng " + room.getRoomNumber() + 
                                    " đã được cập nhật cho tháng " + String.format("%02d", month) + "/" + year + 
                                    ". Số điện tháng này " + reqDTO.getEndElectricity() + " (tăng " + (reqDTO.getEndElectricity() - startElec) + 
                                    "), số nước tháng này " + reqDTO.getEndWater() + " (tăng " + (reqDTO.getEndWater() - startWat) + ")");
            notificationRepository.save(notification);
        }
        usageToSave.setRecordedBy(sender);
        utilityUsageRepository.save(usageToSave);
    }
}
