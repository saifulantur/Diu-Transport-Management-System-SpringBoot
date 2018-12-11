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

import soft.transport.management.model.TransportType;
import soft.transport.management.service.TransportTypeService;

@Controller
public class TransportTypeController {
	
	@Autowired
	private TransportTypeService transportTypeService;
	
	@RequestMapping(value = "/transport_type")
	public String showTransportType() {
		return "viewTransportType";
	}
	/*Return a Java object as JSON response from Spring MVC controller*/
	@RequestMapping(value="/saveTransportType", method = RequestMethod.POST)
	public @ResponseBody String saveTransportType(@RequestBody TransportType transportType,Principal principal) {
		
		if(transportType.getTmpId() > 0) {
			TransportType existingTransportType = transportTypeService.findById(transportType.getTmpId());
			existingTransportType.setCreatedBy(Long.parseLong(principal.getName()));
			existingTransportType.setTypeTitle(transportType.getTypeTitle());
			
			transportTypeService.add(existingTransportType);
			
			return "Data Successfully Updated";
		}
		else {
			transportType.setCreatedBy(Long.parseLong(principal.getName()));
			transportTypeService.add(transportType);
			return "Successfully saved";
		}
		
	}
	
	@RequestMapping(value="/viewAllTransportType"/*, method = RequestMethod.POST*/)
	public @ResponseBody List<TransportType> viewAllTransportType(){
		return transportTypeService.showAllTransportType();
	}
	
	
	@RequestMapping(value="/delete-transport-type",method = RequestMethod.DELETE)
	public @ResponseBody String deleteTransportType(@RequestParam("id")Integer id) {
		transportTypeService.delete(id);
		return "Data Deleted Successfully";
	}

}
