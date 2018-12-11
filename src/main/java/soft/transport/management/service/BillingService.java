package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Billing;

public interface BillingService {
	
	void add(Billing billing);
	void update(Billing billing);
	void delete(int id);
	Billing findById(int id);
	List<Billing> showAllBilling();
	

}
