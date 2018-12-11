package soft.transport.management.model;

import java.util.Date;
//import java.sql.Date;;

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
@Table(name="transportinformation")
public class TransportInformation {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	int id;
	
	@Transient
	private Integer tmpId;
	
	@Column(name="fkTransportType")
	Integer fkTransportType;
	
	@Column(name="vinNumber")
	String vinNumber;
	
	@Column(name="registrationNumber")
	String registrationNumber;
	
	@Column(name="licenseNumber")
	String licenseNumber;
	
	@Column(name="transportName")
	String transportName;
	
	/*@Column(name="fkBrandId")
	Integer fkBrandId;*/
	
	@Column(name="fkModelNo")
	int fkModelNo;
	
	@Column(name="purchaseDate")
	Date purchaseDate;
	
	@Column(name="purchaseBy")
	String purchaseBy;
	
	@Column(name="purchaseReffNo")
	String purchaseReffNo;
	
	@Column(name="purchaseFrom")
	String purchaseFrom;
	
	@Column(name="price")
	int price;
	
	@Column(name="specificaiton")
	String specificaiton;
	
	@Column(name="createdBy")
	private Long createdBy;
	
	public TransportInformation() {
		
	}

	public TransportInformation(int id, Integer fkTransportType, String vinNumber, String registrationNumber,
			String licenseNumber, String transportName, int fkModelNo, Date purchaseDate, String purchaseBy,
			String purchaseReffNo, String purchaseFrom, int price, String specificaiton) {
		//super();
		this.id = id;
		this.fkTransportType = fkTransportType;
		this.vinNumber = vinNumber;
		this.registrationNumber = registrationNumber;
		this.licenseNumber = licenseNumber;
		this.transportName = transportName;
		this.fkModelNo = fkModelNo;
		this.purchaseDate = purchaseDate;
		this.purchaseBy = purchaseBy;
		this.purchaseReffNo = purchaseReffNo;
		this.purchaseFrom = purchaseFrom;
		this.price = price;
		this.specificaiton = specificaiton;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getFkTransportType() {
		return fkTransportType;
	}

	public void setFkTransportType(Integer fkTransportType) {
		this.fkTransportType = fkTransportType;
	}

	public String getVinNumber() {
		return vinNumber;
	}

	public void setVinNumber(String vinNumber) {
		this.vinNumber = vinNumber;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getTransportName() {
		return transportName;
	}

	public void setTransportName(String transportName) {
		this.transportName = transportName;
	}

	/*public Integer getFkBrandId() {
		return fkBrandId;
	}

	public void setFkBrandId(Integer fkBrandId) {
		this.fkBrandId = fkBrandId;
	}*/

	public int getFkModelNo() {
		return fkModelNo;
	}

	public void setFkModelNo(int fkModelNo) {
		this.fkModelNo = fkModelNo;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getPurchaseBy() {
		return purchaseBy;
	}

	public void setPurchaseBy(String purchaseBy) {
		this.purchaseBy = purchaseBy;
	}

	public String getPurchaseReffNo() {
		return purchaseReffNo;
	}

	public void setPurchaseReffNo(String purchaseReffNo) {
		this.purchaseReffNo = purchaseReffNo;
	}

	public String getPurchaseFrom() {
		return purchaseFrom;
	}

	public void setPurchaseFrom(String purchaseFrom) {
		this.purchaseFrom = purchaseFrom;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSpecificaiton() {
		return specificaiton;
	}

	public void setSpecificaiton(String specificaiton) {
		this.specificaiton = specificaiton;
	}
	
	
	
	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	
	
	public Integer getTmpId() {
		return tmpId;
	}

	public void setTmpId(Integer tmpId) {
		this.tmpId = tmpId;
	}

	@Override
	public String toString() {
		return "TransportInformation [id=" + id + ", fkTransportType=" + fkTransportType + ",vinNumber="+vinNumber+", registrationNumber="+registrationNumber+","
				+ ", licenseNumber="+licenseNumber+", transportName="+transportName+",fkModelNo="+fkModelNo+","
						+ ", purchaseDate="+purchaseDate+", purchaseBy="+purchaseBy+",purchaseReffNo="+purchaseReffNo+","
								+ ", purchaseFrom="+purchaseFrom+",price="+price+",specificaiton="+specificaiton+"]";
	}/*end*/

	
	
	
	
	
	

}
