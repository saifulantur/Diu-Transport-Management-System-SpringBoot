package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Venue;

public interface VenueService {
	
	void add(Venue venue);
	void update(Venue venue);
	void delete(int id);
	Venue findById(int id);
	List<Venue> showAllVenue();
	

}
