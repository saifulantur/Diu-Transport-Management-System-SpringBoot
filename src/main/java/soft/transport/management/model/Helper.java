package soft.transport.management.model;

import java.util.Date;

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
@Table(name="helperinformation")
public class Helper {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	Integer id;
	
	@Transient
	Integer tmpId;
	
	@Column(name = "name")
	String helperName;
	
	@Column(name = "helperCode")
	String helperCode;
	
	@Column(name = "dob")
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	Date   helperDateOfBirth;
	
	@Column(name = "drivingLicense")
	String drivingLicense;
	
	@Column(name = "licenseExpireDate")
	Date licenseExpireDate;
	
	@Column(name = "nid")
	String helperNid;
	
	@Column(name = "presentAddress")
	String presentAddress;
	
	@Column(name = "parmanentAddress")
	String parmanentAddress;
	
	@Column(name = "contactNO")
	String helperContactNO;
	
	@Column(name = "email")
	String helperEmail;
	
	@Column(name = "photo")
	String helperImage;
	
	public Helper() {
		
	}
	
	

	public Helper(Integer id, Integer tmpId, String helperName, String helperCode, Date helperDateOfBirth,
			String drivingLicense, Date licenseExpireDate, String helperNid, String presentAddress,
			String parmanentAddress, String helperContactNO, String helperEmail, String helperImage) {
		//super();
		this.id = id;
		this.tmpId = tmpId;
		this.helperName = helperName;
		this.helperCode = helperCode;
		this.helperDateOfBirth = helperDateOfBirth;
		this.drivingLicense = drivingLicense;
		this.licenseExpireDate = licenseExpireDate;
		this.helperNid = helperNid;
		this.presentAddress = presentAddress;
		this.parmanentAddress = parmanentAddress;
		this.helperContactNO = helperContactNO;
		this.helperEmail = helperEmail;
		this.helperImage = helperImage;
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

	public String getHelperName() {
		return helperName;
	}

	public void setHelperName(String helperName) {
		this.helperName = helperName;
	}

	public String getHelperCode() {
		return helperCode;
	}

	public void setHelperCode(String helperCode) {
		this.helperCode = helperCode;
	}

	public Date getHelperDateOfBirth() {
		return helperDateOfBirth;
	}

	public void setHelperDateOfBirth(Date helperDateOfBirth) {
		this.helperDateOfBirth = helperDateOfBirth;
	}

	public String getDrivingLicense() {
		return drivingLicense;
	}

	public void setDrivingLicense(String drivingLicense) {
		this.drivingLicense = drivingLicense;
	}

	public Date getLicenseExpireDate() {
		return licenseExpireDate;
	}

	public void setLicenseExpireDate(Date licenseExpireDate) {
		this.licenseExpireDate = licenseExpireDate;
	}

	public String getHelperNid() {
		return helperNid;
	}

	public void setHelperNid(String helperNid) {
		this.helperNid = helperNid;
	}

	public String getPresentAddress() {
		return presentAddress;
	}

	public void setPresentAddress(String presentAddress) {
		this.presentAddress = presentAddress;
	}

	public String getParmanentAddress() {
		return parmanentAddress;
	}

	public void setParmanentAddress(String parmanentAddress) {
		this.parmanentAddress = parmanentAddress;
	}

	public String getHelperContactNO() {
		return helperContactNO;
	}

	public void setHelperContactNO(String helperContactNO) {
		this.helperContactNO = helperContactNO;
	}

	public String getHelperEmail() {
		return helperEmail;
	}

	public void setHelperEmail(String helperEmail) {
		this.helperEmail = helperEmail;
	}

	public String getHelperImage() {
		return helperImage;
	}

	public void setHelperImage(String helperImage) {
		this.helperImage = helperImage;
	}
	
	@Override
	public String toString() {
		return "Driver [id=" + id + ", helper Name=" + helperName + ", helper Code="+helperCode+", Date of birth="+helperDateOfBirth+""
				+ ", helper License="+drivingLicense+",licenseExpireDate="+licenseExpireDate+",helper NID="+helperNid+", presentAddress="+presentAddress+""
						+ " , parmanentAddress="+parmanentAddress+",helperContactNO="+helperContactNO+",helperEmail="+helperEmail+","
								+ "helper Image="+helperImage+" ]";
	}/*end*/
	
	


}
