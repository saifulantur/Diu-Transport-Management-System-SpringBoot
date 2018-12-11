package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.TransportInformation;

public interface TransportInformationService {
	
	
	void add(TransportInformation transportInformation);
	void update(TransportInformation transportInformation);
	void delete(int id);
	TransportInformation findById(int id);
	List<TransportInformation> showAllTransportInformation();
	List<TransportInformation> findTransportInformationByFkTransportType(int transportTypeId);


}
