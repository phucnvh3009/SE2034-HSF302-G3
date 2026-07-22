package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "utility_usages",
       uniqueConstraints = @UniqueConstraint(columnNames = {"room_id", "semester_id", "recorded_month", "recorded_year"}))
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UtilityUsage extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @Column(name = "recorded_month", nullable = false)
    private Integer recordedMonth;

    @Column(name = "recorded_year", nullable = false)
    private Integer recordedYear;

    @Column(name = "start_electricity", nullable = false)
    private Integer startElectricity;

    @Column(name = "end_electricity", nullable = false)
    private Integer endElectricity;

    @Column(name = "start_water", nullable = false)
    private Integer startWater;

    @Column(name = "end_water", nullable = false)
    private Integer endWater;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recorded_by")
    private User recordedBy; 

    @Column(name = "recorded_at")
    private LocalDateTime recordedAt;
}
