package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.model.IssueReport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IssueReportRepository extends JpaRepository<IssueReport, Long> {

    // Tìm tất cả báo cáo sự cố của sinh viên theo ID
    List<IssueReport> findByStudentIdOrderByCreatedAtDesc(Long studentId);
}
