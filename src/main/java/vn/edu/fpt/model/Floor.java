package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.CommonStatus;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "floors", 
       uniqueConstraints = @UniqueConstraint(columnNames = {"building_id", "floor_number"}))
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Floor extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "building_id", nullable = false)
    private DormitoryBuilding building;
    @Column(name = "floor_number", nullable = false)
    private Integer floorNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20, nullable = false)
    private CommonStatus status;

    @OneToMany(mappedBy = "floor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Room> rooms = new HashSet<>();
}
