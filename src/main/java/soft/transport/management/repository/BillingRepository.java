package soft.transport.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.Billing;

public interface BillingRepository extends JpaRepository<Billing, Integer> {

}
