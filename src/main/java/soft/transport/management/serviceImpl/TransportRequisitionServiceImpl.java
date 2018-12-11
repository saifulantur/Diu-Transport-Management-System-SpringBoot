package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.TransportRequisition;
import soft.transport.management.repository.TransportRequisitionRepository;
import soft.transport.management.service.TransportRequisitionService;

@Service
public class TransportRequisitionServiceImpl implements TransportRequisitionService {
	
	@Autowired
	TransportRequisitionRepository transportRequisitionRepository;

	@Override
	public void add(TransportRequisition transportRequisition) {
		
		transportRequisitionRepository.save(transportRequisition);
		
	}

	@Override
	public void update(TransportRequisition transportRequisition) {
		
		transportRequisitionRepository.save(transportRequisition);
		
	}

	@Override
	public void delete(int id) {
		
		transportRequisitionRepository.deleteById(id);
		
	}

	@Override
	public TransportRequisition findById(int id) {
	
		return transportRequisitionRepository.getOne(id);
	}

	@Override
	public List<TransportRequisition> showAllTransportRequisition() {
		
		return transportRequisitionRepository.findAll();
	}

	/*@Override
	public List<TransportRequisition> findRequisitionRejectedList(String status) {
		
		return transportRequisitionRepository.findRequisitionRejectedList(status);
	}*/

	
	
	
	
	

}
