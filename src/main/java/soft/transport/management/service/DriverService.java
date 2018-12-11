package soft.transport.management.service;

import java.util.List;
import soft.transport.management.model.Driver;

public interface DriverService {
	
	void add(Driver driver);
	void update(Driver driver);
	void delete(int id);
	Driver findById(int id);
	List<Driver> showAllDriverInformation();

}
