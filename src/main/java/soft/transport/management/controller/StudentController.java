package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.Student;
import soft.transport.management.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	StudentService  studentService;
	
	@RequestMapping(value="/studentinfo")
	public String showStudentInfo() {
		
		return "student";
	}
	
	@RequestMapping(value="/saveStudent", method = RequestMethod.POST)
	public @ResponseBody String saveStudent(@RequestBody Student student) {
		
		studentService.add(student);
		return "Successfully saved";
		
	}
	
	@RequestMapping(value="/viewAllStudent", method = RequestMethod.POST)
	public @ResponseBody List<Student> viewAllStudent(){
		
		return studentService.showAllStudent();
	}
	
	/* by me*/
	 @RequestMapping(value = "/showStudentById", method = RequestMethod.POST)
	    public @ResponseBody Student showStudentById( @RequestParam("id") String id ){
	    	
	    	return studentService.findById(id);
	    }/* by me end*/

}
