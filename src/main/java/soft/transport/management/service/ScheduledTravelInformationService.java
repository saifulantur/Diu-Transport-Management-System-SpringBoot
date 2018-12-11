package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.ScheduledTravelInformation;

public interface ScheduledTravelInformationService {

	void add(ScheduledTravelInformation scheduledTravelInformation);
	void update(ScheduledTravelInformation scheduledTravelInformation);
	void delete(Integer id);
	ScheduledTravelInformation findById(Integer id);
	List<ScheduledTravelInformation> showAllScheduleTravelInformation();


}
