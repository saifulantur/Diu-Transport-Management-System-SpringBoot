package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Billing;
import soft.transport.management.repository.BillingRepository;
import soft.transport.management.service.BillingService;

@Service
public class BillingServiceImpl implements BillingService {
	
	@Autowired
	BillingRepository billingRepository;

	@Override
	public void add(Billing billing) {
		billingRepository.save(billing);
		
	}

	@Override
	public void update(Billing billing) {
		billingRepository.save(billing);
		
	}

	@Override
	public void delete(int id) {
		billingRepository.deleteById(id);
		
	}

	@Override
	public Billing findById(int id) {
		
		return billingRepository.getOne(id);
	}

	@Override
	public List<Billing> showAllBilling() {
		
		return billingRepository.findAll();
	}

}
