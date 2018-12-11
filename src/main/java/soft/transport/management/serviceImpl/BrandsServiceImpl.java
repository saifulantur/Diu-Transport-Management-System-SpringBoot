package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Brands;
import soft.transport.management.repository.BrandsRepository;
import soft.transport.management.service.BrandsService;

@Service
public class BrandsServiceImpl implements BrandsService{

	@Autowired
	BrandsRepository brandsRepository;
	
	@Override
	public void add(Brands brands) {
	
		brandsRepository.save(brands);
		
	}

	@Override
	public void update(Brands brands) {
		
		brandsRepository.save(brands);
	}

	@Override
	public void delete(int id) {		
		brandsRepository.deleteById(id);
	}

	@Override
	public Brands findById(int id) {
		
		return brandsRepository.getOne(id);
	}
	
	public List<Brands> showAllBrands(){
		return brandsRepository.findAll();
	}

}
