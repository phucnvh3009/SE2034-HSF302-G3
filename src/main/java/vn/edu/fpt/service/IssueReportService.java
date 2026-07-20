package vn.edu.fpt.service;

import vn.edu.fpt.dto.IssueReportDTO;

import java.util.List;

public interface IssueReportService {

    // Lấy danh sách báo cáo sự cố của sinh viên
    List<IssueReportDTO> getReportsByStudent(Long studentId);

    // Gửi báo cáo sự cố mới
    void createReport(Long studentId, String title, String description, String category);
}
