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

import soft.transport.management.model.ScheduledTravelInformation;
import soft.transport.management.model.TransportSchedule;
import soft.transport.management.service.TransportScheduleService;

@Controller
public class TransportScheduleController {
	
	@Autowired
	TransportScheduleService transportScheduleService;
	
	@RequestMapping(value="/transportschedule")
	public String showTransportSchedule() {
		return "transportschedule";
	}
	
	@RequestMapping(value="/saveTransportSchedule", method = RequestMethod.POST)
	public @ResponseBody String saveTransportSchedule(@RequestBody TransportSchedule transportSchedule,Principal principal ) {
		
			transportSchedule.setCreatedBy(Long.parseLong(principal.getName()));
		
		    transportScheduleService.add(transportSchedule);
			return "Record Saved Successfully.";

	}
	
	
	
	@RequestMapping(value = "/viewAllTransportSchedule", method = RequestMethod.POST)
	public @ResponseBody List<TransportSchedule> viewAllTransportSchedule(){
		
		return transportScheduleService.showAllTransportSchedule();
		
	}
	
	@RequestMapping(value ="/viewTransportScheduleByFkTransportId",method = RequestMethod.POST)
	public @ResponseBody List<TransportSchedule> viewTransportScheduleByFkTransportId(@RequestParam("transportId")Integer transportId){
		return transportScheduleService.findTransportScheduleByFkTransportId(transportId);
	}
	

}
