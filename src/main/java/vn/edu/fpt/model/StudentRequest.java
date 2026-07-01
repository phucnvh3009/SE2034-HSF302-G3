package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.RequestStatus;
import vn.edu.fpt.model.constant.RequestType;

@Entity
@Table(name = "student_requests")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StudentRequest extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String title;

    @Column(name = "description", columnDefinition = "NTEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "type", length = 50, nullable = false)
    private RequestType type;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 50, nullable = false)
    private RequestStatus status;

    // Sinh viên tạo request
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", nullable = false)
    private User student;

    // Staff được phân công xử lý (Dom Manager phân công hoặc tự động theo tầng)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assigned_staff_id")
    private User assignedStaff;

    // Liên quan đến phòng nào (tùy chọn, đối với các lỗi kỹ thuật)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id")
    private Room room;
}
