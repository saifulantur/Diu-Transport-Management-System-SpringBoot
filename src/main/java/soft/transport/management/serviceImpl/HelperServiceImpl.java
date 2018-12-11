package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Helper;
import soft.transport.management.repository.HelperRepository;
import soft.transport.management.service.HelperService;

@Service
public class HelperServiceImpl implements HelperService {
	
	@Autowired
	HelperRepository helperRepository;

	@Override
	public void add(Helper helper) {
		helperRepository.save(helper);
		
	}

	@Override
	public void update(Helper helper) {
		helperRepository.save(helper);
		
	}

	@Override
	public void delete(Integer id) {
		helperRepository.deleteById(id);
		
	}

	@Override
	public Helper findById(Integer id) {
		
		return helperRepository.getOne(id);
	}

	@Override
	public List<Helper> showAllHelperInformation() {
		
		return helperRepository.findAll();
	}

}
