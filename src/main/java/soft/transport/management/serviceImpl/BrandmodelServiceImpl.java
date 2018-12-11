package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Brandmodel;
import soft.transport.management.repository.BrandmodelRepository;
import soft.transport.management.service.BrandmodelService;

@Service
public class BrandmodelServiceImpl implements BrandmodelService {
	
	@Autowired
	BrandmodelRepository brandmodelRepository;
	
	
	public void add(Brandmodel brandmodel) {
	
		brandmodelRepository.save(brandmodel);
		
	}

	public void update(Brandmodel brandmodel) {
		
		brandmodelRepository.save(brandmodel);
	}

	public void delete(int id) {		
		brandmodelRepository.deleteById(id);
	}

	public Brandmodel findById(int id) {
		
		return brandmodelRepository.getOne(id);
	}
	
	public List<Brandmodel> showAllBrandmodel(){
		return brandmodelRepository.findAll();
	}

	@Override
	public List<Brandmodel> findBrandModelByFkBrand(int brandId) {
		
		return brandmodelRepository.findBrandModelByFkBrand(brandId);
	}
	
	
	

}
