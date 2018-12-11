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
@Table(name="transporttype")
public class TransportType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Transient
	private Integer tmpId;
	
	@Column(name="typeTitle")
	private String typeTitle;
	
	@Column(name="createdBy")
	private Long createdBy;
	
	public TransportType() {
		
	}
	
	public TransportType(Integer id, String typeTitle) {
		this.id = id;
		this.typeTitle = typeTitle;
	}


	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}

	


	public Integer getTmpId() {
		return tmpId;
	}

	public void setTmpId(Integer tmpId) {
		this.tmpId = tmpId;
	}

	public String getTypeTitle() {
		return typeTitle;
	}




	public void setTypeTitle(String typeTitle) {
		this.typeTitle = typeTitle;
	}
	
	




	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public String toString() {
		return "typeTitle [id=" + id +", transportType="+ typeTitle +"]";
	}
	
	

}
