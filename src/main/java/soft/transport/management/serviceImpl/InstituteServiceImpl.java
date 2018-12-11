package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Institute;
import soft.transport.management.repository.InstituteRepository;
import soft.transport.management.service.InstituteService;

@Service
public class InstituteServiceImpl implements InstituteService{
	
	@Autowired
	InstituteRepository instituteRepository;

	@Override
	public void add(Institute Institute) {
		instituteRepository.save(Institute);
		
	}

	@Override
	public void update(Institute Institute) {
		instituteRepository.save(Institute);
		
	}

	@Override
	public void delete(int id) {
		instituteRepository.deleteById(id);
		
	}

	@Override
	public Institute findById(int id) {
		
		return instituteRepository.getOne(id);
	}

	@Override
	public List<Institute> showAllInstitute() {
		
		return instituteRepository.findAll();
	}

}
