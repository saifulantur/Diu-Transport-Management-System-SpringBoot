package soft.transport.management.model;


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
@Table(name="transportschedule")
public class TransportSchedule {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name ="fkInstitute")
	private Integer fkInstitute;
	
	@Column(name="fkTransportId")
	private Integer fkTransportId;
	
	@Column(name="fkDriver")
	private Integer fkDriver;
	
	@Column(name="fkHelper")
	private Integer fkHelper;
	
	@Column(name = "fkFromLocation")
	private int fkFromLocation;
	
	@Column(name = "fkToLocation")
	private int fkToLocation;
	
	@Column(name = "departureTime")
	private String departureTime;
	
	@Column(name = "expectedTravelTime")
	private Integer expectedTravelTime;
	
	@Column(name = "capacity")
	private int capacity;
	
	@Column(name="createdBy")
	private Long createdBy;

	
	public TransportSchedule () {
		
	}

	public TransportSchedule(int id, Integer fkInstitute, Integer fkTransportId, Integer fkDriver, Integer fkHelper,
			int fkFromLocation, int fkToLocation, String departureTime, Integer expectedTravelTime, int capacity,
			Long createdBy) {
		//super();
		this.id = id;
		this.fkInstitute = fkInstitute;
		this.fkTransportId = fkTransportId;
		this.fkDriver = fkDriver;
		this.fkHelper = fkHelper;
		this.fkFromLocation = fkFromLocation;
		this.fkToLocation = fkToLocation;
		this.departureTime = departureTime;
		this.expectedTravelTime = expectedTravelTime;
		this.capacity = capacity;
		this.createdBy = createdBy;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public Integer getFkInstitute() {
		return fkInstitute;
	}

	public void setFkInstitute(Integer fkInstitute) {
		this.fkInstitute = fkInstitute;
	}

	public Integer getFkTransportId() {
		return fkTransportId;
	}

	public void setFkTransportId(Integer fkTransportId) {
		this.fkTransportId = fkTransportId;
	}

	public Integer getFkDriver() {
		return fkDriver;
	}

	public void setFkDriver(Integer fkDriver) {
		this.fkDriver = fkDriver;
	}

	public Integer getFkHelper() {
		return fkHelper;
	}

	public void setFkHelper(Integer fkHelper) {
		this.fkHelper = fkHelper;
	}

	public int getFkFromLocation() {
		return fkFromLocation;
	}

	public void setFkFromLocation(int fkFromLocation) {
		this.fkFromLocation = fkFromLocation;
	}

	public int getFkToLocation() {
		return fkToLocation;
	}

	public void setFkToLocation(int fkToLocation) {
		this.fkToLocation = fkToLocation;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public Integer getExpectedTravelTime() {
		return expectedTravelTime;
	}

	public void setExpectedTravelTime(Integer expectedTravelTime) {
		this.expectedTravelTime = expectedTravelTime;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}




	/*@Override
	public String toString() {
		
		return "Transport Schedule [ id= "+id+",fkFromLocation="+fkFromLocation+",fkToLocation="+fkToLocation+","
				+ ",departureTime="+departureTime+",expectedTravelTime="+expectedTravelTime+",capacity="+capacity+",fkTransportType="+fkTransportType+"]";
	}
*/	
	
	
	
	

}
