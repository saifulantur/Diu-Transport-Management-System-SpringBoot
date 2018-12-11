package soft.transport.management.controller;

import java.util.List;
import java.util.concurrent.RejectedExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.type.CollectionLikeType;

import soft.transport.management.model.TransportRequisition;
import soft.transport.management.service.TransportRequisitionService;

@Controller
public class TransportRequisitionApprovalController {
	
	@Autowired
	TransportRequisitionService transportRequisitionService;
	
	@RequestMapping(value = "/transport-requisition-approval")
	public String showTransportRequisitionApproval() {
		return "transportRequisitionApproval";
	}
	
	
	
	/*@RequestMapping(value = "/update-requisition", method = RequestMethod.POST)
	public @ResponseBody String updateRequisition(@RequestBody TransportRequisition transportRequisition) {
		
		if(transportRequisition.getTmpId() > 0) {
			
			TransportRequisition existingTransportRequisition = transportRequisitionService.findById(transportRequisition.getTmpId());
			//existingTransportRequisition.setFkRequestedBy(transportRequisition.getFkRequestedBy());
			//existingTransportRequisition.setTravelDate(transportRequisition.getTravelDate());
			//existingTransportRequisition.setFkTransportType(transportRequisition.getFkTransportType());
			//existingTransportRequisition.setPurpose(transportRequisition.getPurpose());
			existingTransportRequisition.setStatus("A");
			existingTransportRequisition.setComments(transportRequisition.getComments());
			
			transportRequisitionService.add(existingTransportRequisition);
			
			return "Requisition Approved";
			
		}
		return "Requisition Not Approved";
	}*/
	@RequestMapping(value = "/update-requisition", method = RequestMethod.POST)
	public @ResponseBody String testUpdateRequisition(@RequestBody TransportRequisition transportRequisition) {
		
		
		
		System.out.println("Message= "+transportRequisition.getStatus());
		
		try {
		
		if(transportRequisition.getStatus().equals("P")) {
			
			TransportRequisition existingTransportRequisition = transportRequisitionService.findById(transportRequisition.getTmpId());
			existingTransportRequisition.setStatus("A");
			existingTransportRequisition.setComments(transportRequisition.getComments());
			
			transportRequisitionService.add(existingTransportRequisition);
			
			return "Requisition Approved";
			
			/*if(Click on approved button) {
				
				existingTransportRequisition.setStatus("A");
				
				return "Requisition Successfully Approved";
				
			}
			
			else if(cliked on RejectedExecutionException Button) {
				
				existingTransportRequisition.setStatus("R");
				return "Requisition Successfully Rejected";
			}
			
			existingTransportRequisition.setComments(transportRequisition.getComments());
		}*/
		
		
		
	}return "Eroor";}
		catch(Exception e) {
			System.out.println("not found");
		}
		
		return null;
		
	
	}
	
	/*@RequestMapping(value = "/view-transport-reuisition-rejected", method = RequestMethod.POST)
	public @ResponseBody List<TransportRequisition> viewTransportReuisitionRejectedList(@RequestParam("status")  String status){
		
		return transportRequisitionService.findRequisitionRejectedList(status);
		
	}*/
}
