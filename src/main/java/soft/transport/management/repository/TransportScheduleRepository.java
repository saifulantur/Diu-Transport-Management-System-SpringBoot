package soft.transport.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.TransportSchedule;

public interface TransportScheduleRepository extends JpaRepository<TransportSchedule, Integer> {
	
	List<TransportSchedule> findTransportScheduleByFkTransportId(Integer fkTrnsportId);

}
