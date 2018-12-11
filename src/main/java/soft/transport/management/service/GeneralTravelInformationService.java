package soft.transport.management.service;

import java.util.List;
import soft.transport.management.model.GeneralTravelInformation;

public interface GeneralTravelInformationService {
	
	void add(GeneralTravelInformation generalTravelInformation);
	void Update(GeneralTravelInformation generalTravelInformation);
	void delete(Integer id);
	GeneralTravelInformation findById(Integer id);
	List<GeneralTravelInformation> showALlGeneralTravelInformation();

}
