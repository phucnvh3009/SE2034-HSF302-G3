package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.CommonStatus;
import vn.edu.fpt.model.constant.GenderType;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "dormitory_buildings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DormitoryBuilding extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, unique = true, columnDefinition = "NVARCHAR(100)")
    private String name; // Ví dụ: "Tòa A", "Tòa B"

    @Enumerated(EnumType.STRING)
    @Column(name = "gender_type", length = 20, nullable = false)
    private GenderType genderType; // MALE, FEMALE, MIXED

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20, nullable = false)
    private CommonStatus status; // ACTIVE, INACTIVE

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_id")
    private User manager;

    // Một tòa nhà có nhiều tầng
    @OneToMany(mappedBy = "building", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Floor> floors = new HashSet<>();
}