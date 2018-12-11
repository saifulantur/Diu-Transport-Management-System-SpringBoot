package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.Venue;
import soft.transport.management.service.VenueService;

@Controller
public class VenueController {
	
	@Autowired
	VenueService venueService;
	
	@RequestMapping(value="/venue")
	public String showVenue() {
		
		return "venue";
	}
	
	@RequestMapping(value="/saveVene", method = RequestMethod.POST)
	public @ResponseBody String saveVenue(@RequestBody Venue venue) {
		
		if(venue.getTmpId() > 0) {
			
			Venue existingVenue = venueService.findById(venue.getTmpId());
			//Venue existingVenue1 = venueService.findById(venue.getTmpId());
			existingVenue.setVenueName(venue.getVenueName());
			existingVenue.setLocationMap(venue.getLocationMap());
			
			venueService.add(existingVenue);
			//venueService.add(existingVenue1);
			
			return "Data Successfully Updated";
			
		}
		
		else {
			venueService.add(venue);
			return "Data Successfully Saved";
			
		}
		
		
	}
	
	@RequestMapping(value="/viewAllVenue", method = RequestMethod.POST)
	public @ResponseBody List<Venue> viewAllVenue(){
		return venueService.showAllVenue();
	}
	
	
	

}
