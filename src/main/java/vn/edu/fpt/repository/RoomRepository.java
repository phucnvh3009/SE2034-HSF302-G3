package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.Room;
import vn.edu.fpt.model.constant.RoomStatus;

import java.util.List;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {

    // Lấy tất cả phòng đang còn chỗ (ACTIVE), kèm thông tin tầng, tòa nhà, loại phòng
    @Query("SELECT r FROM Room r " +
           "JOIN FETCH r.floor f " +
           "JOIN FETCH f.building b " +
           "JOIN FETCH r.roomType rt " +
           "WHERE r.status = :status")
    List<Room> findAllByStatusWithDetails(RoomStatus status);

    // Lấy phòng theo loại phòng (tên loại phòng)
    @Query("SELECT r FROM Room r " +
           "JOIN FETCH r.floor f " +
           "JOIN FETCH f.building b " +
           "JOIN FETCH r.roomType rt " +
           "WHERE r.status = :status AND rt.typeName LIKE %:typeName%")
    List<Room> findByStatusAndRoomTypeName(RoomStatus status, String typeName);
}
