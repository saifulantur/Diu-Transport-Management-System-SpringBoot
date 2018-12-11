package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Brandmodel;


public interface BrandmodelService {
	
	void add(Brandmodel brandmodel);
	void update(Brandmodel brandmodel);
	void delete(int id);
	Brandmodel findById(int id);
	List<Brandmodel> showAllBrandmodel();
	List<Brandmodel> findBrandModelByFkBrand(int brandId);

}
