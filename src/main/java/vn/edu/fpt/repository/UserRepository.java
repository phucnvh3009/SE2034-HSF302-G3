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

    Optional<User> findByEmail(String email);

    @Query("SELECT u FROM User u JOIN u.userRoles ur JOIN ur.role r WHERE r.roleName = :roleName")
    List<User> findAllByRoleName(@Param("roleName") RoleName roleName);
}
