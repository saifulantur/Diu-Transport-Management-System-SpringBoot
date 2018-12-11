package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.ViewUniversityBusSchedule;
import soft.transport.management.repository.ViewUniversityBusScheduleRepository;
import soft.transport.management.service.ViewUniversityBusScheduleService;

@Service
public class ViewUniversityBusScheduleServiceImpl implements ViewUniversityBusScheduleService {
	
	@Autowired
	private ViewUniversityBusScheduleRepository viewUniversityBusScheduleRepository;

	@Override
	public List<ViewUniversityBusSchedule> findAllUniversityBusSchedule() {
		
		return viewUniversityBusScheduleRepository.findAll();
	}

}
