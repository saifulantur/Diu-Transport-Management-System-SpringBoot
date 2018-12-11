package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.GeneralTravelInformation;
import soft.transport.management.service.GeneralTravelInformationService;

@Controller
public class GeneralTravelInformationController {
	
	@Autowired
	GeneralTravelInformationService generalTravelInformationService;
	
	
	@RequestMapping(value="/generaltravelinformation")
	public String showGeneralTravelInformation() {
		return "generaltravelinformation";
	}
	
	@RequestMapping(value = "/saveGeneralTravelInformation",method = RequestMethod.POST)
	public @ResponseBody String saveGeneralTravelInformation(@RequestBody GeneralTravelInformation generalTravelInformation) {
		
		if(generalTravelInformation.getTmpId() > 0) {
			 
			GeneralTravelInformation existingGeneralTravelInformation = generalTravelInformationService.findById(generalTravelInformation.getTmpId());
			
			existingGeneralTravelInformation.setFkTrnsportId(generalTravelInformation.getFkTrnsportId());
			existingGeneralTravelInformation.setFkFromLocation(generalTravelInformation.getFkFromLocation());
			existingGeneralTravelInformation.setFkToLocation(generalTravelInformation.getFkToLocation());
			existingGeneralTravelInformation.setDepartureTime(generalTravelInformation.getDepartureTime());
			existingGeneralTravelInformation.setFkDriverId(generalTravelInformation.getFkDriverId());
			existingGeneralTravelInformation.setFkRequisitionId(generalTravelInformation.getFkRequisitionId());
			existingGeneralTravelInformation.setTravelDate(generalTravelInformation.getTravelDate());
			existingGeneralTravelInformation.setDriverCheckInTime(generalTravelInformation.getDriverCheckInTime());
			existingGeneralTravelInformation.setReachedTime(generalTravelInformation.getReachedTime());
			existingGeneralTravelInformation.setComments(generalTravelInformation.getComments());
			
			generalTravelInformationService.add(existingGeneralTravelInformation);
			
			return "Data Updated Successfully";
		}
		
		else {
		generalTravelInformationService.add(generalTravelInformation);
		return "Data Successfully Saved";
		}
	}
	
	@RequestMapping(value="/viewAllGeneralTravelInformation", method = RequestMethod.POST)
	public @ResponseBody List<GeneralTravelInformation> GeneralTravelInformation() {
		return generalTravelInformationService.showALlGeneralTravelInformation();
	}

}
