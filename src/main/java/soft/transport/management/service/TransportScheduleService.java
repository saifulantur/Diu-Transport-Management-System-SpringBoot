package soft.transport.management.service;

import java.util.List;
import soft.transport.management.model.TransportSchedule;

public interface TransportScheduleService {
	
	void add(TransportSchedule transportSchedule);
	void update(TransportSchedule transportSchedule);
	void delete(int id);
	TransportSchedule findById(int id);
	List<TransportSchedule> showAllTransportSchedule();
	List<TransportSchedule> findTransportScheduleByFkTransportId(Integer transportId);

}
