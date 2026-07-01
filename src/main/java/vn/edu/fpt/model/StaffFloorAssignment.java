package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.CommonStatus;

import java.time.LocalDate;

@Entity
@Table(name = "staff_floor_assignments")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StaffFloorAssignment extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Nhân viên (Dormitory Staff) được phân công
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "staff_id", nullable = false)
    private User staff;

    // Tầng được phân công
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "floor_id", nullable = false)
    private Floor floor;

    @Column(name = "assigned_date", nullable = false)
    private LocalDate assignedDate;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20, nullable = false)
    private CommonStatus status; // ACTIVE (Đang phân công), INACTIVE (Đã kết thúc)
}
