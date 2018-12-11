package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.TransportRequisition;

public interface TransportRequisitionService {
	
	
	void add(TransportRequisition transportRequisition);
	void update(TransportRequisition transportRequisition);
	void delete(int id);
	TransportRequisition findById(int id);
	List<TransportRequisition> showAllTransportRequisition();
	//List<TransportRequisition> findRequisitionRejectedList(String status);
	

}
