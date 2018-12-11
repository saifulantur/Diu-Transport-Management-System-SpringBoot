package soft.transport.management.repository;

import soft.transport.management.model.Role;
import soft.transport.management.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository  extends JpaRepository<Role, Long> {

    List<Role> findRolesByUserList(User user);
}
