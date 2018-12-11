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

import soft.transport.management.model.Brands;
import soft.transport.management.service.BrandsService;

@Controller
public class BrandsController {
	
	/*-----------2--------------*/
	@Autowired
	BrandsService brandServices;

	/*-------------2----------------*/
	
	@RequestMapping(value="/brands")
	public String showBrandPage() {
		return "viewBrands";
	}
	
	/*start*/
	@RequestMapping(value="/saveBrands", method = RequestMethod.POST)
	public @ResponseBody String saveBrands(@RequestBody Brands brands,Principal principal) {
		
		try {
			
			if(brands.getTmpId() > 0) {
				Brands existingBrands = brandServices.findById(brands.getTmpId());
				existingBrands.setCreatedBy(Long.parseLong(principal.getName()));
				existingBrands.setBrandName(brands.getBrandName());
				brandServices.add(existingBrands);
				return "Data Updated Successfully.";
			}
			else {
				brands.setCreatedBy(Long.parseLong(principal.getName()));
				brandServices.add(brands);
				return "Record Saved Successfully.";
			}
			
		} catch (Exception e) {
			
			return "Brand You Entered Already Existing";
		}
	}
	
	@RequestMapping(value="/viewAllBrands", method = RequestMethod.POST)
	public @ResponseBody List<Brands> viewAllBrands() {
		return brandServices.showAllBrands();
	}
	/*End*/
	
	@RequestMapping(value="/delete-brand", method = RequestMethod.POST)
	public @ResponseBody String deleteBrands(@RequestParam("id") int id){
		System.out.println("id: = " + id);
		brandServices.delete(id);
		return "Record Deleted Successfully.";
	}
	
}
