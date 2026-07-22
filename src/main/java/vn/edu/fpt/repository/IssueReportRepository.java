package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.edu.fpt.model.IssueReport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IssueReportRepository extends JpaRepository<IssueReport, Long> {
    @Query("SELECT ir FROM IssueReport ir WHERE ir.room.floor.building.id = :buildingId ORDER BY ir.createdAt DESC")
    List<IssueReport> findByBuildingId(@Param("buildingId") Long buildingId);
    // Tìm tất cả báo cáo sự cố của sinh viên theo ID
    List<IssueReport> findByStudentIdOrderByCreatedAtDesc(Long studentId);
}
