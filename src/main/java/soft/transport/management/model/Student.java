package soft.transport.management.model;

import javax.persistence.Column;
import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//import com.fasterxml.jackson.annotation.JsonIdentityInfo;
//import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
//@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property="id")
@Table(name="student")
public class Student {
	
	@Id
	/*@GeneratedValue(strategy = GenerationType.IDENTITY)*/
	@Column(name="id")
	String id;
	
	@Column(name="name")
	String name;
	
	@Column(name="age")
	int age;
	
	public Student() {
		
	}

	public Student(String id, String name, int age) {
		this.id = id;
		this.name = name;
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "Student [id = "+ id +", name= "+ name +", age="+ age +"]";
	}
	
	
	

}
