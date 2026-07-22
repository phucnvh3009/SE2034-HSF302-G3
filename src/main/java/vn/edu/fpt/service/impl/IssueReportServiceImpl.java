package vn.edu.fpt.service.impl;

import lombok.AllArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.dto.IssueReportDTO;
import vn.edu.fpt.dto.response.domstaff.ReportDTO;
import vn.edu.fpt.dto.response.domstaff.ReportDetailDTO;
import vn.edu.fpt.model.Contract;
import vn.edu.fpt.model.IssueReport;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.ContractStatus;
import vn.edu.fpt.model.constant.ReportCategory;
import vn.edu.fpt.model.constant.ReportStatus;
import vn.edu.fpt.repository.ContractRepository;
import vn.edu.fpt.repository.IssueReportRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.IssueReportService;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.data.domain.Sort;

@Service
@Transactional
@AllArgsConstructor
public class IssueReportServiceImpl implements IssueReportService {
    private IssueReportRepository issueReportRepository;
  
    private final IssueReportRepository reportRepository;
    private final ContractRepository contractRepository;
    private final UserRepository userRepository;

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm").withZone(java.time.ZoneId.systemDefault());
    @Override
    public List<ReportDTO> getAllIssueReports(Long BuildingId) {
        List<ReportDTO> reportDTOList = new ArrayList<>();
        List<IssueReport> issueReports = issueReportRepository.findByBuildingId(BuildingId);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")
                .withZone(java.time.ZoneId.systemDefault());

        for (IssueReport issueReport : issueReports) {
            String createdAt = issueReport.getCreatedAt() != null ? formatter.format(issueReport.getCreatedAt()) : "";
            
            reportDTOList.add(new ReportDTO(
                    issueReport.getId().toString(),
                    issueReport.getStudent().getLastName() + " " + issueReport.getStudent().getFirstName(),
                    issueReport.getCategory().name(),
                    issueReport.getStatus().name(),
                    createdAt
            ));
        }
        return reportDTOList;
    }

    @Override
    public ReportDetailDTO getIssueReportById(Long id) {
        IssueReport report = issueReportRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy yêu cầu"));
                
        String studentCode = "";
        if (report.getStudent().getStudentProfile() != null) {
            studentCode = report.getStudent().getStudentProfile().getStudentCode();
        }
        
        // Format ngày tháng
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")
                .withZone(java.time.ZoneId.systemDefault());
        String createdAt = report.getCreatedAt() != null ? formatter.format(report.getCreatedAt()) : "";
        
        return new ReportDetailDTO(
                report.getId().toString(),
                report.getStudent().getLastName() + " " + report.getStudent().getFirstName(),
                studentCode,
                createdAt,
                report.getCategory().name(),
                report.getTitle(),
                report.getDescription(),
                report.getStaffNote(),
                report.getStatus().name()
        );
    }

    @Override
    public void updateReportStatusAndNote(Long id, ReportStatus status, String staffNote) {
        IssueReport report = issueReportRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy yêu cầu"));

        report.setStatus(status);
        report.setStaffNote(staffNote);

        issueReportRepository.save(report);
    }

    @Override
    @Transactional(readOnly = true)
    public List<IssueReportDTO> getReportsByStudent(Long studentId) {
        return reportRepository.findByStudentIdOrderByCreatedAtDesc(studentId).stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void createReport(Long studentId, String title, String description, String category) {
        User student = userRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sinh viên!"));

        // Tìm phòng từ hợp đồng hoạt động của sinh viên
        Contract contract = contractRepository
                .findFirstByStudentIdAndStatus(studentId, ContractStatus.ACTIVE)
                .orElseThrow(() -> new RuntimeException("Bạn hiện tại chưa có phòng ở hoạt động trong học kỳ này để tạo báo cáo sự cố!"));

        IssueReport report = new IssueReport();
        report.setTitle(title);
        report.setDescription(description);
        report.setCategory(ReportCategory.valueOf(category.toUpperCase()));
        report.setStatus(ReportStatus.PENDING);
        report.setStudent(student);
        report.setRoom(contract.getBed().getRoom());

        reportRepository.save(report);
    }

    private IssueReportDTO toDTO(IssueReport report) {
        IssueReportDTO dto = new IssueReportDTO();
        dto.setId(report.getId());
        dto.setTitle(report.getTitle());
        dto.setDescription(report.getDescription());
        dto.setCategory(report.getCategory().name());
        dto.setCategoryName(getCategoryNameVi(report.getCategory()));
        dto.setStatus(report.getStatus().name());
        dto.setStatusName(getStatusNameVi(report.getStatus()));
        dto.setStaffNote(report.getStaffNote());
        
        if (report.getRoom() != null) {
            dto.setRoomName(report.getRoom().getFloor().getBuilding().getName() + "-" + report.getRoom().getRoomNumber());
        } else {
            dto.setRoomName("Chưa xác định");
        }
        
        if (report.getCreatedAt() != null) {
            dto.setCreatedAt(DATE_TIME_FORMATTER.format(report.getCreatedAt()));
        } else {
            dto.setCreatedAt("N/A");
        }

        return dto;
    }

    private String getCategoryNameVi(ReportCategory category) {
        switch (category) {
            case ELECTRICITY:
            case ELECTRICAL: return "Điện";
            case WATER: return "Nước";
            case FACILITY: return "Cơ sở vật chất";
            case CLEANLINESS: return "Vệ sinh";
            case SECURITY: return "An ninh";
            default: return "Khác";
        }
    }

    private String getStatusNameVi(ReportStatus status) {
        switch (status) {
            case PENDING: return "Chờ duyệt";
            case IN_PROGRESS: return "Đang xử lý";
            case RESOLVED: return "Đã giải quyết";
            case REJECTED: return "Bị từ chối";
            default: return "Không xác định";
        }
    }
}
