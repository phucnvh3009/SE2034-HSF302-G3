package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.ContractStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "contracts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Contract extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "contract_code", length = 50, unique = true, nullable = false)
    private String contractCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", nullable = false)
    private User student;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bed_id", nullable = false)
    private Bed bed;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @Column(name = "price", nullable = false)
    private BigDecimal price;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 30, nullable = false)
    private ContractStatus status;

    @Column(name = "checked_out_at")
    private LocalDateTime checkedOutAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "checked_out_by")
    private User checkedOutBy;
}
