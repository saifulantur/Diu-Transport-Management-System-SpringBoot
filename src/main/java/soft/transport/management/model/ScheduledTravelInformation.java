package soft.transport.management.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "id")
@Table(name="sheduledtravelinformation")
public class ScheduledTravelInformation {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name="id")
	 private Integer id;
	 
	 @Column(name="fkTrnsportId")
	 private Integer fkTrnsportId;
	 
	 @Column(name="fkScheduleId")
	 private Integer fkScheduleId;
	 
	 @Column(name="fkDriverId")
	 private Integer fkDriverId;
	 
	 @Column(name="travelDate")
	 private Date travelDate;
	 
	 @Column(name="actualDepartureTime")
	 private String departureTime;
	 
	 @Column(name="actualReachedTime")
	 private String arrivalTime;
	 
	 @Column(name="comments")
	 private String comments;
	 
	 public ScheduledTravelInformation() {
		 
	 }

	public ScheduledTravelInformation(Integer id, Integer fkTrnsportId, Integer fkScheduleId, Integer fkDriverId,
			Date travelDate, String departureTime, String arrivalTime, String comments) {
		//super();
		this.id = id;
		this.fkTrnsportId = fkTrnsportId;
		this.fkScheduleId = fkScheduleId;
		this.fkDriverId = fkDriverId;
		this.travelDate = travelDate;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
		this.comments = comments;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFkTrnsportId() {
		return fkTrnsportId;
	}

	public void setFkTrnsportId(Integer fkTrnsportId) {
		this.fkTrnsportId = fkTrnsportId;
	}

	public Integer getFkScheduleId() {
		return fkScheduleId;
	}

	public void setFkScheduleId(Integer fkScheduleId) {
		this.fkScheduleId = fkScheduleId;
	}

	public Integer getFkDriverId() {
		return fkDriverId;
	}

	public void setFkDriverId(Integer fkDriverId) {
		this.fkDriverId = fkDriverId;
	}

	public Date getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	/*@Override
	public String toString() {
		return "Brands [id=" + id + ", brandName=" + brandName + "]";
	}*/
	 
	 

}
