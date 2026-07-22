package vn.edu.fpt.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.StudentStatus;

@Entity
@Table(name = "student_profiles")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StudentProfile extends BaseAuditEntity {

    @Id
    @Column(name = "user_id")
    private Long userId;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "student_code", length = 20, unique = true, nullable = false)
    @NotBlank(message = "Mã số sinh viên không được để trống")
    @Pattern(
            regexp = "^[A-Z]{2}[0-9]{6}$",
            message = "Mã số sinh viên phải đúng định dạng (Ví dụ: SE150123)"
    )
    private String studentCode;

    @Column(name = "major", columnDefinition = "NVARCHAR(200)", nullable = false)
    private String major;

    @Column(name = "academic_year", length = 10)
    private String academicYear; // Khóa học (ví dụ: K17)

    @Column(name = "parent_phone", length = 15)
    @Pattern(
            regexp = "^[0-9]{10,11}$",
            message = "Số điện thoại phụ huynh phải chứa từ 10 đến 11 chữ số"
    )
    private String parentPhone;

    @Enumerated(EnumType.STRING)
    @Column(name = "student_status", length = 20, nullable = false)
    private StudentStatus studentStatus = StudentStatus.ACTIVE;

}