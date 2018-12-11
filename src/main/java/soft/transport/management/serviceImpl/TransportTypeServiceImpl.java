package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.TransportType;
import soft.transport.management.repository.TransportTypeRepository;
import soft.transport.management.service.TransportTypeService;

@Service
public class TransportTypeServiceImpl implements TransportTypeService {
	
	@Autowired
	TransportTypeRepository transportTypeRespository;

	@Override
	public void add(TransportType transportType) {
		transportTypeRespository.save(transportType);
		
	}

	@Override
	public void update(TransportType transportType) {
		transportTypeRespository.save(transportType);
		
	}

	@Override
	public void delete(int id) {
		transportTypeRespository.deleteById(id);
		
	}

	@Override
	public TransportType findById(int id) {
		return transportTypeRespository.getOne(id);
	}

	@Override
	public List<TransportType> showAllTransportType() {
		return transportTypeRespository.findAll();
	}

}
