package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Driver;
import soft.transport.management.repository.DriverRepository;
import soft.transport.management.service.DriverService;

@Service
public class DriverServiceImpl implements DriverService {
	
	@Autowired
	DriverRepository driverRepository;

	@Override
	public void add(Driver driver) {
		driverRepository.save(driver);
		
	}

	@Override
	public void update(Driver driver) {
		driverRepository.save(driver);
		
	}

	@Override
	public void delete(int id) {
		driverRepository.deleteById(id);
		
	}

	@Override
	public Driver findById(int id) {
		
		return driverRepository.getOne(id);
	}

	@Override
	public List<Driver> showAllDriverInformation() {
		return driverRepository.findAll();
	}
	

}
