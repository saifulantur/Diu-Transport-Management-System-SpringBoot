package soft.transport.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import soft.transport.management.model.TransportRequisition;

public interface TransportRequisitionRepository extends JpaRepository<TransportRequisition, Integer>{
	
	/*@Query("select * from transportrequisition tr where tr.status = 'R'")
	List<TransportRequisition> findRequisitionRejectedList(@Param("status") String status);*/

}
