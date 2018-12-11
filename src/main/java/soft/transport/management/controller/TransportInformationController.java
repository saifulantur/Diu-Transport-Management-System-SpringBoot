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
import soft.transport.management.model.TransportInformation;
import soft.transport.management.service.TransportInformationService;

@Controller
public class TransportInformationController {
	
	@Autowired
	TransportInformationService transportInformationService;
	
	@RequestMapping(value="/transportinformation")
	public String showTransportInformation()
	{
		return "transportinformation";
	}
	
	@RequestMapping(value="/saveTransportInformation")
	public @ResponseBody  String saveTransportinformation(@RequestBody TransportInformation transportInformation, Principal principal) {
//		transportInformation.setCreatedBy(Long.parseLong(principal.getName()));
//		transportInformationService.add(transportInformation);
//		return "Successfully Saved";
		
		try {
			if(transportInformation.getTmpId() > 0) {
				TransportInformation existingTransportInformation = transportInformationService.findById(transportInformation.getTmpId());
//				existingTransportInformation.setCreatedBY(Long.parseLong(principal.getName()));
				existingTransportInformation.setFkTransportType(transportInformation.getFkTransportType());
				existingTransportInformation.setRegistrationNumber(transportInformation.getRegistrationNumber());

				existingTransportInformation.setVinNumber(transportInformation.getVinNumber());
				existingTransportInformation.setLicenseNumber(transportInformation.getLicenseNumber());

				existingTransportInformation.setTransportName(transportInformation.getTransportName());
				existingTransportInformation.setRegistrationNumber(transportInformation.getRegistrationNumber());

				existingTransportInformation.setFkModelNo(transportInformation.getFkModelNo());
				existingTransportInformation.setPurchaseDate(transportInformation.getPurchaseDate());

				existingTransportInformation.setPurchaseBy(transportInformation.getPurchaseBy());
				existingTransportInformation.setPurchaseReffNo(transportInformation.getPurchaseReffNo());

				existingTransportInformation.setPurchaseFrom(transportInformation.getPurchaseFrom());
				existingTransportInformation.setPrice(transportInformation.getPrice());
				
				existingTransportInformation.setSpecificaiton(transportInformation.getSpecificaiton());
				
				
				transportInformationService.add(existingTransportInformation);
				return "Data Successfully Updated";
			}
			
			else {
				
//			brandmodel.setCreatedBY(Long.parseLong(principal.getName()));
				transportInformationService.add(transportInformation);
			return "Record Saved Successfully.";
			
			}
		}catch(Exception e) {
			
			return "Error, This Model is existing for the Brand.";
			
		}
	}
	
	@RequestMapping(value="/viewAllTransportInformation"/*, method = RequestMethod.POST*/ )
	public @ResponseBody List<TransportInformation> viewAllTransportInformation(){
		
		return transportInformationService.showAllTransportInformation();
	}
	
	@RequestMapping(value="/viewTransportInformationByFkTransportType", method = RequestMethod.POST)
	public @ResponseBody List<TransportInformation> viewTransportInformationByFkTransportType(@RequestParam("transportTypeId") int transportTypeId) {
		
		return transportInformationService.findTransportInformationByFkTransportType(transportTypeId);
	}

}
