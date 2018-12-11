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
@Table(name="billing")
public class Billing {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	Integer id;
	
	@Transient
	int tmpId;
	
	@Column(name="billingSector")
	String billingSector;
	
	@Column(name ="billingAmount")
	Integer billingAmount;
	
	@Column(name="fkBillingReference")
	Integer fkBillingReference;
	
	public Billing() {
		
	}
	
	

	public Billing(Integer id, String billingSector, Integer billingAmount, Integer fkBillingReference) {
		//super();
		this.id = id;
		this.billingSector = billingSector;
		this.billingAmount = billingAmount;
		this.fkBillingReference = fkBillingReference;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public int getTmpId() {
		return tmpId;
	}



	public void setTmpId(int tmpId) {
		this.tmpId = tmpId;
	}



	public String getBillingSector() {
		return billingSector;
	}

	public void setBillingSector(String billingSector) {
		this.billingSector = billingSector;
	}

	public Integer getBillingAmount() {
		return billingAmount;
	}

	public void setBillingAmount(Integer billingAmount) {
		this.billingAmount = billingAmount;
	}

	public Integer getFkBillingReference() {
		return fkBillingReference;
	}

	public void setFkBillingReference(Integer fkBillingReference) {
		this.fkBillingReference = fkBillingReference;
	}
	
	
	@Override
	public String toString() {
		return "Billing [id=" + id + ", billingSector=" + billingSector + ", billingAmount "+billingAmount+ ", fkBillingReference"+fkBillingReference+"]";
	}
	
	

}
