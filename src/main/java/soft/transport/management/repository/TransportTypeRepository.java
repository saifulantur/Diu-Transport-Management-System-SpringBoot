package soft.transport.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.TransportType;

public interface TransportTypeRepository extends JpaRepository<TransportType, Integer> {

}
