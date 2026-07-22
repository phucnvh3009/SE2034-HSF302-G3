package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.*;
import vn.edu.fpt.model.constant.NotificationCategory;
import vn.edu.fpt.model.constant.NotificationTarget;

@Entity
@Table(name = "notifications")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Notification extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String title;

    @Column(name = "content", nullable = false, columnDefinition = "NVARCHAR(4000)")
    private String content;

    @Enumerated(EnumType.STRING)
    @Column(name = "category", nullable = false, length = 30)
    private NotificationCategory category;

    @Enumerated(EnumType.STRING)
    @Column(name = "target_type", nullable = false, length = 20)
    private NotificationTarget targetType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_building_id")
    private DormitoryBuilding targetBuilding;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_student_id")
    private User targetStudent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sender_id", nullable = false)
    private User sender;
}