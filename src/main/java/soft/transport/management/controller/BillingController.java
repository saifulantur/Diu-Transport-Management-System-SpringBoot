package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.Billing;
import soft.transport.management.service.BillingService;

@Controller
public class BillingController {
	
	
	@Autowired
	BillingService billingService;
	
	 @RequestMapping(value = "/bill")
	    public String showBill() {
	        return "bill";
	    }
	 
	 /*@RequestMapping(value="/updateBilling", method = RequestMethod.POST)
		public @ResponseBody String saveBrandmodel(@RequestBody Brandmodel brandmodel) { ///eita banao
			
			brandmodelService.add(brandmodel);
			return "Record Saved Successfully.";
		}
		
	 */
	 
	 @RequestMapping(value = "/saveBilling", method = RequestMethod.POST)
	 public @ResponseBody String saveBill(@RequestBody Billing billing) {
		 
		 if(billing.getTmpId() > 0) {
			 Billing existingBilling = billingService.findById(billing.getTmpId());
			 existingBilling.setBillingSector(billing.getBillingSector());
			 existingBilling.setBillingAmount(billing.getBillingAmount());
			 existingBilling.setFkBillingReference(billing.getFkBillingReference());
			 
			 billingService.add(existingBilling);
			 
			 return "Data Updated Successfully.";
			 
		 }
		 
		 else {
			 
			 billingService.add(billing);
			 return "Record Saved Successfully.";
			 
		 }
		 
		
	 }
	 
	 @RequestMapping(value="/viewAllBilling", method = RequestMethod.POST)
		public @ResponseBody List<Billing> viewAllBilling() {
			return billingService.showAllBilling();
		}
	 

}
