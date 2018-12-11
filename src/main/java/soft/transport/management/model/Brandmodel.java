package soft.transport.management.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "id")
@Table(name="brandmodel")
public class Brandmodel{
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Transient
	private Integer tmpId;
	
	//for foreign key start
	
	@Column(name="fkBrand")
	private int fkBrand;
	
	//for foreign key start end
	
	@Column(name="modelNo")
	private String modelNo;
	
	@Column(name="createdBy")
	private Long createdBY;
	
	

	public Brandmodel() {
		
	}

	public Brandmodel(int id, int fkBrand, String modelNo, Long createdBY) {
		//super();
		this.id = id;
		this.fkBrand = fkBrand;
		this.modelNo = modelNo;
		this.createdBY = createdBY;
	}
	//for foreign key mapping 
	//start
	
	//@OneToMany(mappedBy="brandmodelMapping",cascade = CascadeType.ALL)
	//@JoinColumn(name = "id")
//	private List<Brands> brandslist = new ArrayList<>();
	
	//end
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
    
	public Integer getTmpId() {
		return tmpId;
	}

	public void setTmpId(Integer tmpId) {
		this.tmpId = tmpId;
	}

	//foreign key start
	public int getFkBrand() {
		return fkBrand;
	}

	public void setFkBrand(int fkBrand) {
		this.fkBrand = fkBrand;
	}
	////end

	public String getModelNo() {
		return modelNo;
	}

	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}

	public Long getCreatedBY() {
		return createdBY;
	}

	public void setCreatedBY(Long createdBY) {
		this.createdBY = createdBY;
	}
	
	

	/*public List<Brands> getBrandslist() {
		return brandslist;
	}

	public void setBrandslist(List<Brands> brandslist) {
		this.brandslist = brandslist;
	}*/
	
	
	
	
	
	
	

}
