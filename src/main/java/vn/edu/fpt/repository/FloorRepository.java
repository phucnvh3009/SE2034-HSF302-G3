package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.Floor;

import java.util.List;

@Repository
public interface FloorRepository extends JpaRepository<Floor, Long> {
    List<Floor> findByBuilding_Id(Long buildingId);
}
