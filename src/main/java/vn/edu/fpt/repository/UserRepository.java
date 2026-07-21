package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.User;
import vn.edu.fpt.model.constant.RoleName;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u LEFT JOIN FETCH u.userRoles ur LEFT JOIN FETCH ur.role WHERE u.email = :email")
    Optional<User> findByEmail(@Param("email") String email);

    @Query("SELECT u FROM User u JOIN u.userRoles ur JOIN ur.role r WHERE r.roleName = :roleName")
    List<User> findAllByRoleName(@Param("roleName") RoleName roleName);

    @Query("SELECT u FROM User u JOIN u.userRoles ur JOIN ur.role r " +
            "WHERE r.roleName = :roleName " +
            "AND (:keyword IS NULL OR LOWER(u.firstName) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "     OR LOWER(u.lastName) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "     OR LOWER(u.middleName) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "     OR LOWER(u.email) LIKE LOWER(CONCAT('%', :keyword, '%'))) " +
            "AND (:status IS NULL OR u.isActive = :status)")
    List<User> searchManagers(@Param("roleName") RoleName roleName,
                              @Param("keyword") String keyword,
                              @Param("status") Boolean status);

}
