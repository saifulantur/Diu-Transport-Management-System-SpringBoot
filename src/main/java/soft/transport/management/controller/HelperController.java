package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.Helper;
import soft.transport.management.service.HelperService;

@Controller
public class HelperController {
	
	@Autowired
	HelperService helperService;
	
	@RequestMapping(value="/helperinformation")
	public String showDriver() {
		return "helperinformation";
	}
	
	@RequestMapping(value="/saveHelper")
	// , method = RequestMethod.POST
	public @ResponseBody String saveHelper(@RequestBody Helper helper) {
	
		
		if(helper.getTmpId() > 0) {
			Helper existingHelper = helperService.findById(helper.getTmpId());
			existingHelper.setHelperName(helper.getHelperName());
			existingHelper.setHelperCode(helper.getHelperCode());
			existingHelper.setHelperDateOfBirth(helper.getHelperDateOfBirth());
			existingHelper.setDrivingLicense(helper.getDrivingLicense());
			existingHelper.setLicenseExpireDate(helper.getLicenseExpireDate());
			existingHelper.setHelperNid(helper.getHelperNid());
			existingHelper.setPresentAddress(helper.getPresentAddress());
			existingHelper.setParmanentAddress(helper.getParmanentAddress());
			existingHelper.setHelperContactNO(helper.getHelperContactNO());
			existingHelper.setHelperEmail(helper.getHelperEmail());
			existingHelper.setHelperImage(helper.getHelperImage());
			
			helperService.add(existingHelper);
			return "Data Successfully Updated";
		}
		
		else {
			helperService.add(helper);
			return "Data Successfully saved";
		}
	}
	
	@RequestMapping(value="/viewAllHelper", method = RequestMethod.POST)
	public @ResponseBody List<Helper> viewAllDriver() {
		return helperService.showAllHelperInformation();
	}

	

}
