package vn.edu.fpt.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.fpt.model.constant.GenderType;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String firstName;

    @Column(name = "middle_name", columnDefinition = "NVARCHAR(255)")
    private String middleName;

    @Column(name = "last_name", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String lastName;

    @Column(name = "email", nullable = false, unique = true)
    @Email
    private String email;

    @Column(name = "password_hash", nullable = false)
    private String passwordHash;

    @Column(name = "phone", length = 15)
    private String phone;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", length = 10)
    private GenderType gender;

    @Column(name = "dob")
    private LocalDate dob;

    @Column(name = "avatar", length = 500)
    private String avatar;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "address_id")
    private Address address;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<UserRole> userRoles = new HashSet<>();

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private StudentProfile studentProfile;
}
