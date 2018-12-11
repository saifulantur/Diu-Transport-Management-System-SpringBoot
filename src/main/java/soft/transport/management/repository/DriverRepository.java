package soft.transport.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.Driver;

public interface DriverRepository extends JpaRepository<Driver, Integer> {

}
