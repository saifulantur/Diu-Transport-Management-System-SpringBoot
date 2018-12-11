package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.ScheduledTravelInformation;
import soft.transport.management.service.ScheduledTravelInformationService;

@Controller
public class ScheduledTravelInformationController {
	
	@Autowired
	ScheduledTravelInformationService scheduledTravelInformationService;
	
	@RequestMapping(value = "/view-scheduled-transport-information")
	public String showScheduledTravelInformation() {
		return "view-scheduled-transport-information";
	}
	
	@RequestMapping(value="/saveScheduledTravelInfo",method = RequestMethod.POST)
	public @ResponseBody String saveScheduledTravelInfo(@RequestBody ScheduledTravelInformation scheduledTravelInformation) {
		scheduledTravelInformationService.add(scheduledTravelInformation);
		return "Data Successfully Saved";
	}
	
	@RequestMapping(value="/viewAllScheduledInfo", method = RequestMethod.POST)
	public @ResponseBody List<ScheduledTravelInformation> viewScheduledTravelInfo(){
		return scheduledTravelInformationService.showAllScheduleTravelInformation();
	}
	

	
	

}
