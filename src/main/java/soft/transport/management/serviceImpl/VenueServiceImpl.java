package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Venue;
import soft.transport.management.repository.VenueRepository;
import soft.transport.management.service.VenueService;

@Service
public class VenueServiceImpl implements VenueService {
	
	@Autowired
	VenueRepository venueRepository;

	@Override
	public void add(Venue venue) {
		venueRepository.save(venue);
		
	}

	@Override
	public void update(Venue venue) {
		venueRepository.save(venue);
		
	}

	@Override
	public void delete(int id) {
		venueRepository.deleteById(id);
		
	}

	@Override
	public Venue findById(int id) {
		
		return venueRepository.getOne(id);
	}

	@Override
	public List<Venue> showAllVenue() {
		
		return venueRepository.findAll();
	}

}
