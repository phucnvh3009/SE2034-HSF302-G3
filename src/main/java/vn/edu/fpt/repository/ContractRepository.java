package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.Contract;

import vn.edu.fpt.model.constant.ContractStatus;
import java.util.List;
import java.util.Optional;

@Repository
public interface ContractRepository extends JpaRepository<Contract, Long> {

    // Kiểm tra giường đã được đăng ký chưa (chờ duyệt hoặc đang ở)
    boolean existsByBedIdAndStatusIn(Long bedId,
            java.util.List<vn.edu.fpt.model.constant.ContractStatus> statuses);

    // Tìm tất cả hợp đồng của sinh viên
    List<Contract> findByStudentIdOrderByCreatedAtDesc(Long studentId);

    // Tìm hợp đồng theo trạng thái gần nhất
    Optional<Contract> findFirstByStudentIdAndStatus(Long studentId, ContractStatus status);
}
