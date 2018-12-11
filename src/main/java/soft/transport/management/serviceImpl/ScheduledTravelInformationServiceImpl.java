package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.ScheduledTravelInformation;
import soft.transport.management.repository.ScheduledTravelInformationRepository;
import soft.transport.management.service.ScheduledTravelInformationService;

@Service
public class ScheduledTravelInformationServiceImpl implements ScheduledTravelInformationService {
	
	@Autowired
	ScheduledTravelInformationRepository scheduledTravelInformationRepository;

	@Override
	public void add(ScheduledTravelInformation scheduledTravelInformation) {
		scheduledTravelInformationRepository.save(scheduledTravelInformation);
		
	}

	@Override
	public void update(ScheduledTravelInformation scheduledTravelInformation) {
		scheduledTravelInformationRepository.save(scheduledTravelInformation);
		
	}

	@Override
	public void delete(Integer id) {
		scheduledTravelInformationRepository.deleteById(id);
		
	}

	@Override
	public ScheduledTravelInformation findById(Integer id) {
		
		return scheduledTravelInformationRepository.getOne(id);
	}

	@Override
	public List<ScheduledTravelInformation> showAllScheduleTravelInformation() {
		
		return scheduledTravelInformationRepository.findAll();
	}

	



}
