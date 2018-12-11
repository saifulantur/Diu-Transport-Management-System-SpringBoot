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
@Table(name="brands")
public class Brands {
	
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="brandName")
	private String brandName; 
	
	
	//edit and update
	@Transient
	private int tmpId;
	
	@Column(name="createdBy")
	private Long createdBy;
	
	//end
	
	public Brands() {
		
	}
	
	
	public Brands(int id, String brandName) {
		//super();
		this.id = id;
		this.brandName = brandName;
	}
	
	//for foreign key mapping
	/*@ManyToOne
    @JoinColumn(name="cart_id", nullable=false)
    private Cart cart;
 
    public ItemEntry() {}*/
	
	
	//@ManyToOne(fetch = FetchType.LAZY)
   // @JoinColumn(name = "id")
	//private Brandmodel brandmodelMapping;
	
	//end

	public int getId() {
		return id;
	}

	/*public Brandmodel getBrandmodelMapping() {
		return brandmodelMapping;
	}


	public void setBrandmodelMapping(Brandmodel brandmodelMapping) {
		this.brandmodelMapping = brandmodelMapping;
	}*/


	public void setId(int id) {
		this.id = id;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	
	//edit & update
	
	public int getTmpId() {
		return tmpId;
	}


	public void setTmpId(int tmpId) {
		this.tmpId = tmpId;
	}
	
	
	
	
	//end
	
	/*start*/

	public Long getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}


	@Override
	public String toString() {
		return "Brands [id=" + id + ", brandName=" + brandName + "]";
	}/*end*/


	
	
}
