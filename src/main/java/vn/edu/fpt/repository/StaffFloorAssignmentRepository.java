package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.StaffFloorAssignment;

@Repository
public interface StaffFloorAssignmentRepository extends JpaRepository<StaffFloorAssignment, Long> {
}
