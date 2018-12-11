package soft.transport.management.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.ScheduledTravelInformation;


public interface ScheduledTravelInformationRepository extends JpaRepository<ScheduledTravelInformation, Integer>{

	
}
