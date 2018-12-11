package soft.transport.management.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.Brandmodel;
import soft.transport.management.service.BrandmodelService;

@Controller
public class BrandmodelController {
	
	@Autowired
	BrandmodelService brandmodelService;
	
	@RequestMapping(value="/brandmodel")
	public String showBrandmodel(/*Brands brands*/) {
		
		return "brandmodel";
	}
	
	@RequestMapping(value="/saveBrandmodel", method = RequestMethod.POST)
	public @ResponseBody String saveBrandmodel(@RequestBody Brandmodel brandmodel,Principal principal) {
	
		try {
			if(brandmodel.getTmpId() > 0) {
				Brandmodel existingBrandmodel = brandmodelService.findById(brandmodel.getTmpId());
				existingBrandmodel.setCreatedBY(Long.parseLong(principal.getName()));
				existingBrandmodel.setFkBrand(brandmodel.getFkBrand());
				existingBrandmodel.setModelNo(brandmodel.getModelNo());
				
				brandmodelService.add(existingBrandmodel);
				return "Data Successfully Updated";
			}
			
			else {
				
			brandmodel.setCreatedBY(Long.parseLong(principal.getName()));
			brandmodelService.add(brandmodel);
			return "Record Saved Successfully.";
			
			}
		}catch(Exception e) {
			
			return "Error, This Model is existing for the Brand.";
			
		}
	}
	
	
	@RequestMapping(value="/viewAllBrandmodel", method = RequestMethod.POST)
	public @ResponseBody List<Brandmodel> viewAllBrandmodel() {
		return brandmodelService.showAllBrandmodel();
	}
	
	@RequestMapping(value="/viewModelByBrands", method = RequestMethod.POST)
	public @ResponseBody List<Brandmodel> viewModelByBrands(@RequestParam("brandId") int brandId) {
		
		return brandmodelService.findBrandModelByFkBrand(brandId);
	}
	

}
