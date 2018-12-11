package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.TransportInformation;
import soft.transport.management.repository.TransportInformationRepository;
import soft.transport.management.service.TransportInformationService;

@Service
public class TransportInformationServiceImpl implements TransportInformationService {
	
	
	@Autowired
	TransportInformationRepository transportInformationRepository;

	@Override
	public void add(TransportInformation transportInformation) {
		
		transportInformationRepository.save(transportInformation);
		
	}

	@Override
	public void update(TransportInformation transportInformation) {
		
		transportInformationRepository.save(transportInformation);
		
	}

	@Override
	public void delete(int id) {
		
		transportInformationRepository.deleteById(id);
		
	}

	@Override
	public TransportInformation findById(int id) {
		
		return transportInformationRepository.getOne(id);
	}

	@Override
	public List<TransportInformation> showAllTransportInformation() {
		
		return transportInformationRepository.findAll();
	}

	@Override
	public List<TransportInformation> findTransportInformationByFkTransportType(int transportTypeId) {
		
		return transportInformationRepository.findTransportInformationByFkTransportType(transportTypeId);
	}

}
