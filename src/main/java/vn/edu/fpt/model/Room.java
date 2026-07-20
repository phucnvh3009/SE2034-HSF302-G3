package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.RoomStatus;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "rooms", 
       uniqueConstraints = @UniqueConstraint(columnNames = {"floor_id", "room_number"}))
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Room extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "floor_id", nullable = false)
    private Floor floor; // Thuộc tầng nào

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_type_id", nullable = false)
    private RoomType roomType; // Thuộc loại phòng nào (để lấy giá tiền và tiện ích)

    @Column(name = "room_number", length = 10, nullable = false)
    private String roomNumber; // Số phòng (ví dụ: "101", "201")

    @Column(name = "max_beds", nullable = false)
    private Integer maxBeds; // Số giường tối đa (ví dụ: 4 hoặc 8)

    @Column(name = "current_occupancy", nullable = false)
    private Integer currentOccupancy = 0;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20, nullable = false)
    private RoomStatus status; // ACTIVE, FULL, MAINTENANCE

    // Một phòng có nhiều giường
    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Bed> beds = new HashSet<>();
}
