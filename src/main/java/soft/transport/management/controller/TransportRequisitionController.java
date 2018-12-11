package soft.transport.management.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.TransportRequisition;
import soft.transport.management.service.TransportRequisitionService;

@Controller
public class TransportRequisitionController {
	
	@Autowired
	TransportRequisitionService transportRequisitionService;
	
	@RequestMapping(value = "/transportrequisition")
	public String showTransportRequisition() {
		
		return "transportrequisition";
	}
	
	@RequestMapping(value = "/saveTransportRequisition",  method = RequestMethod.POST)
	public @ResponseBody String saveTransportRequisition(@RequestBody TransportRequisition  transportRequisition, Principal principal) {
		transportRequisition.setFkRequestedBy(Long.parseLong(principal.getName()));
		transportRequisition.setStatus("P");
		transportRequisition.setComments("");
		
		//System.out.println(transportRequisition.toString());
		transportRequisitionService.add(transportRequisition);
		return "Record Saved Successfully.";
		
	}
	
	@RequestMapping(value = "/viewTransportRequisition", method = RequestMethod.POST)
	public @ResponseBody List<TransportRequisition> viewAllTransportRequisition(){
		
		return transportRequisitionService.showAllTransportRequisition();
	}
		

}

