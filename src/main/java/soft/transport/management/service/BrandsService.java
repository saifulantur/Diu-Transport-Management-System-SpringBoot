package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Brands;

public interface BrandsService {

	void add(Brands brands);
	void update(Brands brands);
	void delete(int id);
	Brands findById(int id);
	List<Brands> showAllBrands();
}
