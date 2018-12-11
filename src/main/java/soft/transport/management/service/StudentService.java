package soft.transport.management.service;

import java.util.List;

import soft.transport.management.model.Student;

public interface StudentService {
	
	void add(Student student);
	void update(Student student);
	void delete(String id);
	Student findById(String id);
	List<Student> showAllStudent();

}
