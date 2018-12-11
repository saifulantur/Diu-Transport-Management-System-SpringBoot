package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Institute;

public interface InstituteService {
	
	void add(Institute Institute);
	void update(Institute Institute);
	void delete(int id);
	Institute findById(int id);
	List<Institute> showAllInstitute();

}
