package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.UtilityUsage;

import java.util.List;
import java.util.Optional;

@Repository
public interface UtilityUsageRepository extends JpaRepository<UtilityUsage, Long> {
    
    @Query("SELECT u FROM UtilityUsage u WHERE u.room.floor.building.id = :buildingId " +
           "ORDER BY u.room.roomNumber ASC, u.recordedYear DESC, u.recordedMonth DESC")
    List<UtilityUsage> findAllWithRoom(@Param("buildingId") Long buildingId);

    Optional<UtilityUsage> findTopByRoomIdOrderByRecordedYearDescRecordedMonthDesc(Long roomId);

    Optional<UtilityUsage> findByRoomIdAndSemesterIdAndRecordedMonthAndRecordedYear(Long roomId, Long semesterId, Integer month, Integer year);
}
