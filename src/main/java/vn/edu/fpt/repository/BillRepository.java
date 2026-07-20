package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.Bill;
import vn.edu.fpt.model.constant.BillStatus;

import java.util.List;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

    // Tìm hóa đơn của sinh viên theo ID
    List<Bill> findByStudentIdOrderByIssueDateDesc(Long studentId);

    // Tìm hóa đơn của sinh viên theo trạng thái
    List<Bill> findByStudentIdAndStatusOrderByIssueDateDesc(Long studentId, BillStatus status);

    // Đếm số hóa đơn chưa thanh toán của sinh viên
    long countByStudentIdAndStatus(Long studentId, BillStatus status);
}
