package soft.transport.management.service;

import java.util.List;
import soft.transport.management.model.Helper;

public interface HelperService {
	
	void add(Helper helper);
	void update(Helper helper);
	void delete(Integer id);
	Helper findById(Integer id);
	List<Helper> showAllHelperInformation();

}
