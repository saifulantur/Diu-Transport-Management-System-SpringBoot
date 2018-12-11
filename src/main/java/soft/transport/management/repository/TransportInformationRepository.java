package soft.transport.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import soft.transport.management.model.TransportInformation;

public interface TransportInformationRepository extends JpaRepository<TransportInformation, Integer> {
	
	
	List<TransportInformation> findTransportInformationByFkTransportType(Integer transportTypeId);

}
