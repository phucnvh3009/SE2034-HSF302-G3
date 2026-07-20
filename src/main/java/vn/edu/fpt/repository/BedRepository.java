package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.Bed;
import vn.edu.fpt.model.constant.BedStatus;

import java.util.List;

@Repository
public interface BedRepository extends JpaRepository<Bed, Long> {

    // Lấy tất cả giường trống của một phòng
    List<Bed> findByRoomIdAndStatus(Long roomId, BedStatus status);

    // Đếm số giường trống của một phòng
    long countByRoomIdAndStatus(Long roomId, BedStatus status);
}
