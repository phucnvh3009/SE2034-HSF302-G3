package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.DormitoryBuilding;
import vn.edu.fpt.model.constant.CommonStatus;

import java.util.List;
import java.util.Optional;

@Repository
public interface DormitoryBuildingRepository extends JpaRepository<DormitoryBuilding,Long> {

    List<DormitoryBuilding> findAllByStatus(CommonStatus status);

    Optional<DormitoryBuilding> findByManagerId(Long managerId);

}
