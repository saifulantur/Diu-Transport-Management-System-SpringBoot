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
@Table(name = "generaltravelinformation")
public class GeneralTravelInformation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	Integer id;
	
	//edit and delete
	@Transient
	int tmpId;
	//end
	
	@Column(name = "fkTrnsportId")
	Integer fkTrnsportId;
	
	@Column(name = "fkFromLocation")
	Integer fkFromLocation;
	
	@Column(name = "fkToLocation")
	Integer fkToLocation;
	
	@Column(name = "departureTime")
	String departureTime;
	
	@Column(name = "fkDriverId")
	Integer fkDriverId;
	
	@Column(name = "fkRequisitionId")
	Integer fkRequisitionId;
	
	@Column(name = "travelDate")
	Date travelDate;
	
	@Column(name = "driverCheckInTime")
	String driverCheckInTime;
	
	@Column(name = "reachedTime")
	String reachedTime;
	
	@Column(name = "comments")
	String comments;
	
	
	public GeneralTravelInformation(){
		
	}

	public GeneralTravelInformation(Integer id, Integer fkTrnsportId, Integer fkFromLocation, Integer fkToLocation,
			String departureTime, Integer fkDriverId, Integer fkRequisitionId, Date travelDate,
			String driverCheckInTime, String reachedTime, String comments) {
		//super();
		this.id = id;
		this.fkTrnsportId = fkTrnsportId;
		this.fkFromLocation = fkFromLocation;
		this.fkToLocation = fkToLocation;
		this.departureTime = departureTime;
		this.fkDriverId = fkDriverId;
		this.fkRequisitionId = fkRequisitionId;
		this.travelDate = travelDate;
		this.driverCheckInTime = driverCheckInTime;
		this.reachedTime = reachedTime;
		this.comments = comments;
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

	public Integer getFkTrnsportId() {
		return fkTrnsportId;
	}

	public void setFkTrnsportId(Integer fkTrnsportId) {
		this.fkTrnsportId = fkTrnsportId;
	}

	public Integer getFkFromLocation() {
		return fkFromLocation;
	}

	public void setFkFromLocation(Integer fkFromLocation) {
		this.fkFromLocation = fkFromLocation;
	}

	public Integer getFkToLocation() {
		return fkToLocation;
	}

	public void setFkToLocation(Integer fkToLocation) {
		this.fkToLocation = fkToLocation;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public Integer getFkDriverId() {
		return fkDriverId;
	}

	public void setFkDriverId(Integer fkDriverId) {
		this.fkDriverId = fkDriverId;
	}

	public Integer getFkRequisitionId() {
		return fkRequisitionId;
	}

	public void setFkRequisitionId(Integer fkRequisitionId) {
		this.fkRequisitionId = fkRequisitionId;
	}

	public Date getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}

	public String getDriverCheckInTime() {
		return driverCheckInTime;
	}

	public void setDriverCheckInTime(String driverCheckInTime) {
		this.driverCheckInTime = driverCheckInTime;
	}

	public String getReachedTime() {
		return reachedTime;
	}

	public void setReachedTime(String reachedTime) {
		this.reachedTime = reachedTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "General Travel Information [id=" + id + ", fkTrnsportId=" + fkTrnsportId +", fkFromLocation=" + fkFromLocation +", fkToLocation=" + fkToLocation +", departureTime=" + departureTime +", fkDriverId=" + fkDriverId +", fkRequisitionId=" + fkRequisitionId +", travelDate=" + travelDate +", driverCheckInTime=" + driverCheckInTime +", reachedTime=" + reachedTime +", comments=" + comments + "]";
	}
	
	

}
