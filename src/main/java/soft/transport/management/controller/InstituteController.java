package soft.transport.management.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.Institute;
import soft.transport.management.service.InstituteService;

@Controller
public class InstituteController {
	
	@Autowired
	private InstituteService instituteService;
	
	@RequestMapping(value="/institute")
	public String showInstitute() {
		return "viewInstitute";
	}
	
	@RequestMapping(value="/save-institute", method = RequestMethod.POST)
	public @ResponseBody String saveInstitue(@RequestBody Institute institute,Principal principal) {
		
		if(institute.getTmpId() >0 ) {
			Institute existingInstitute = instituteService.findById(institute.getTmpId());
			
			existingInstitute.setCreatedBy(Long.parseLong(principal.getName()));
			existingInstitute.setInstituteName(institute.getInstituteName());
			
			instituteService.add(existingInstitute);
			
			return "Data Successfully Updated";
		}
		
		else {
			institute.setCreatedBy(Long.parseLong(principal.getName()));
		    instituteService.add(institute);
			return "Record Saved Successfully.";
		}
		
	}
	
	@RequestMapping(value="/viewAllInstitute"/*, method = RequestMethod.POST*/)
	public @ResponseBody List<Institute> viewAllInstitute() {
		return instituteService.showAllInstitute();
	}

}
