package soft.transport.management.repository;

import soft.transport.management.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UsersRepository extends JpaRepository<User, Long> {
    User findByUserName(String userName);
}
