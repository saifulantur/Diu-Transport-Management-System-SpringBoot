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
@Table(name = "transportrequisition")
public class TransportRequisition {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Transient
	private Integer tmpId;
	
	@Column(name = "fkRequestedBy")
	private Long fkRequestedBy;
	
	@Column(name = "travelDate")
	private String travelDate;
	
	@Column(name = "fkTransportType")
	private int fkTransportType;
	
	@Column(name = "purpose")
	private String purpose;
	
	@Column(name = "status")
	private String status;
	
	@Transient
	private String tmpStatus;
	
	/*@Column(name = "fkApproveBy")
	int fkApproveBy;*/
	
	@Column(name = "comments")
	private String comments;
	
	public TransportRequisition() {
		
	}

	public TransportRequisition(int id, Long fkRequestedBy,String travelDate,
			int fkTransportType, String purpose, String status/*, int fkApproveBy*/, 
			String comments) {
		//super();
		this.id = id;
		this.fkRequestedBy = fkRequestedBy;
		this.travelDate = travelDate;
		this.fkTransportType = fkTransportType;
		this.purpose = purpose;
		this.status = status;
		//this.fkApproveBy = fkApproveBy;
	
		this.comments = comments;
	}

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

	public Long getFkRequestedBy() {
		return fkRequestedBy;
	}

	public void setFkRequestedBy(Long fkRequestedBy) {
		this.fkRequestedBy = fkRequestedBy;
	}

	

	

	public String getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}

	public int getFkTransportType() {
		return fkTransportType;
	}

	public void setFkTransportType(int fkTransportType) {
		this.fkTransportType = fkTransportType;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	/*public int getFkApproveBy() {
		return fkApproveBy;
	}

	public void setFkApproveBy(int fkApproveBy) {
		this.fkApproveBy = fkApproveBy;
	}*/

	

	

	public String getTmpStatus() {
		return tmpStatus;
	}

	public void setTmpStatus(String tmpStatus) {
		this.tmpStatus = tmpStatus;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	/*@Override
	public String toString() {
		return "TransportRequisition [id=" + id + ", fkRequestedBy=" + fkRequestedBy + ", travelDate ="+travelDate+","
				+ "fkTransportType="+fkTransportType+", purpose="+purpose+",status="+status+",fkApproveBy="+fkApproveBy+",comments="+comments+"]";
	}*/

}
