package soft.transport.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.Brandmodel;

public interface BrandmodelRepository extends JpaRepository<Brandmodel, Integer> {
	
	List<Brandmodel> findBrandModelByFkBrand(int brandId);

}
