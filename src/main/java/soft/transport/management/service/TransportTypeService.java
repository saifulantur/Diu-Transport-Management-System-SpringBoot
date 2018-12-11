package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.TransportType;

public interface TransportTypeService {
	
	void add(TransportType transportType);
	void update(TransportType transportType);
	void delete(int id);
	TransportType findById(int id);
	List<TransportType> showAllTransportType();
	

}
