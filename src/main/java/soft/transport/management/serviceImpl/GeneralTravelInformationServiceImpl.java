package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.GeneralTravelInformation;
import soft.transport.management.repository.GeneralTravelInformationRepository;
import soft.transport.management.service.GeneralTravelInformationService;

@Service
public class GeneralTravelInformationServiceImpl implements GeneralTravelInformationService {
	
	@Autowired
	GeneralTravelInformationRepository generalTravelInformationRepository;

	@Override
	public void add(GeneralTravelInformation generalTravelInformation) {
		generalTravelInformationRepository.save(generalTravelInformation);
		
	}

	@Override
	public void Update(GeneralTravelInformation generalTravelInformation) {
		generalTravelInformationRepository.save(generalTravelInformation);
		
	}

	@Override
	public void delete(Integer id) {
		generalTravelInformationRepository.deleteById(id);
		
	}

	@Override
	public GeneralTravelInformation findById(Integer id) {
		// TODO Auto-generated method stub
		return generalTravelInformationRepository.getOne(id);
	}

	@Override
	public List<GeneralTravelInformation> showALlGeneralTravelInformation() {
		// TODO Auto-generated method stub
		return generalTravelInformationRepository.findAll();
	}

}
