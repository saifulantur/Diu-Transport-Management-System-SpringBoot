package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.TransportSchedule;
import soft.transport.management.repository.TransportScheduleRepository;
import soft.transport.management.service.TransportScheduleService;

@Service
public class TransportScheduleServiceImpl implements TransportScheduleService {
	
	@Autowired
	TransportScheduleRepository transportScheduleRepository;

	@Override
	public void add(TransportSchedule transportSchedule) {
		
		transportScheduleRepository.save(transportSchedule);
		
	}

	@Override
	public void update(TransportSchedule transportSchedule) {
		
		transportScheduleRepository.save(transportSchedule);
		
	}

	@Override
	public void delete(int id) {
		
		transportScheduleRepository.deleteById(id);
		
	}

	@Override
	public TransportSchedule findById(int id) {
		
		return transportScheduleRepository.getOne(id);
	}

	@Override
	public List<TransportSchedule> showAllTransportSchedule() {
		// TODO Auto-generated method stub
		return transportScheduleRepository.findAll();
	}

	@Override
	public List<TransportSchedule> findTransportScheduleByFkTransportId(Integer transportId) {
		
		return transportScheduleRepository.findTransportScheduleByFkTransportId(transportId);
	}

}
