package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.ViewUniversityBusSchedule;
import soft.transport.management.service.ViewUniversityBusScheduleService;

@Controller
public class ViewUniversityBusScheduleController {
	
	@Autowired
	private ViewUniversityBusScheduleService viewUniversityBusScheduleService;
	
	@RequestMapping(value = "/rpt-university-bus-schedule")
	public String ViewUniversityBusSchedule() {
		return "rptUniversitySchedule";
	}
	
	@RequestMapping(value = "/view-all-University-bus-schedule")
	public @ResponseBody List<ViewUniversityBusSchedule> showUniversityBusSchedule(){
		
		return viewUniversityBusScheduleService.findAllUniversityBusSchedule();
	}
}
