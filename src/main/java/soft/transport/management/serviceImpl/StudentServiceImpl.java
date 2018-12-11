package soft.transport.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import soft.transport.management.model.Student;
import soft.transport.management.repository.StudentRepository;
import soft.transport.management.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentRepository studentRepository;
	
	@Override
	public void add(Student student) {
		studentRepository.save(student);
		
	}

	@Override
	public void update(Student student) {
		studentRepository.save(student);
		
	}

	@Override
	public void delete(String id) {
		studentRepository.deleteById(id);
		
	}

	@Override
	public Student findById(String id) {
		
		//return studentRepository.getOne(id);
		return studentRepository.getOne(id);
	}

	@Override
	public List<Student> showAllStudent() {
		return studentRepository.findAll();
	}

}
