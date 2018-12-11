package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.ViewBrandModel;
import soft.transport.management.repository.ViewBrandModelRepository;
import soft.transport.management.service.ViewBrandModelService;

@Service
public class ViewBrandModelServiceImpl implements ViewBrandModelService{
	
	@Autowired
	private ViewBrandModelRepository viewBrandModelRepository;

	@Override
	public List<ViewBrandModel> findAllBrandModel() {
		
		return viewBrandModelRepository.findAll();
	}

}
