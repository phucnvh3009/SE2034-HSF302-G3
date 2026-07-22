package vn.edu.fpt.service;

import vn.edu.fpt.dto.response.domstaff.ReportDTO;
import vn.edu.fpt.dto.response.domstaff.ReportDetailDTO;
import vn.edu.fpt.model.IssueReport;
import vn.edu.fpt.model.constant.ReportStatus;
import vn.edu.fpt.dto.IssueReportDTO;

import java.util.List;

public interface IssueReportService {
    List<ReportDTO> getAllIssueReports(Long BuildingId);
    ReportDetailDTO getIssueReportById(Long id);
    void updateReportStatusAndNote(Long id, ReportStatus status, String staffNote);

    // Lấy danh sách báo cáo sự cố của sinh viên
    List<IssueReportDTO> getReportsByStudent(Long studentId);

    // Gửi báo cáo sự cố mới
    void createReport(Long studentId, String title, String description, String category);
}
