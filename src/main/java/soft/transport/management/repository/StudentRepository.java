package soft.transport.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import soft.transport.management.model.Student;


public interface StudentRepository extends JpaRepository<Student, String> {
	/**/
	//Student findById(String id);
/**/

}
