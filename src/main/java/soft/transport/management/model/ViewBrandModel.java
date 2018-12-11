package soft.transport.management.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

@Entity
@Immutable
@Table(name = "brandandmodel")
public class ViewBrandModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String id;
	
	private String brandName;	
	
	private String model;
	
	public ViewBrandModel() {
		
	}
	
	
	public ViewBrandModel(String brandName, String model) {
		//super();
		this.brandName = brandName;
		this.model = model;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
