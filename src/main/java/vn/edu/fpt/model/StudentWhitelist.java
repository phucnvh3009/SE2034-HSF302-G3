package vn.edu.fpt.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.GenderType;

@Entity
@Table(name = "student_whitelists",
       uniqueConstraints = {
           @UniqueConstraint(columnNames = {"student_code", "semester_id"}),
           @UniqueConstraint(columnNames = {"email", "semester_id"})
       })
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StudentWhitelist extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "student_code", length = 20, nullable = false)
    private String studentCode;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "full_name", columnDefinition = "NVARCHAR(200)", nullable = false)
    private String fullName;

    @Column(name = "phone", length = 15, nullable = false)
    private String phone;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", length = 10, nullable = false)
    private GenderType gender;

    @Column(name = "major", columnDefinition = "NVARCHAR(200)", nullable = false)
    private String major;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @Column(name = "is_registered", nullable = false)
    private Boolean isRegistered = false;
}
