package soft.transport.management.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

@Entity
@Immutable
@Table(name = "viewbusschedule")
public class ViewUniversityBusSchedule implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String id;
	
	private String busName;
	private String startingTime;
	private String stationFrom;
	private String stationTo;
	private String driverName;
	private String helperName;
	private String helperContact;
	
	public ViewUniversityBusSchedule() {
		
	}
	
	
	
	public ViewUniversityBusSchedule(String id, String busName, String startingTime, String stationFrom,
			String stationTo, String driverName, String helperName, String helperContact) {
		//super();
		this.id = id;
		this.busName = busName;
		this.startingTime = startingTime;
		this.stationFrom = stationFrom;
		this.stationTo = stationTo;
		this.driverName = driverName;
		this.helperName = helperName;
		this.helperContact = helperContact;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getStartingTime() {
		return startingTime;
	}

	public void setStartingTime(String startingTime) {
		this.startingTime = startingTime;
	}

	public String getStationFrom() {
		return stationFrom;
	}

	public void setStationFrom(String stationFrom) {
		this.stationFrom = stationFrom;
	}

	public String getStationTo() {
		return stationTo;
	}

	public void setStationTo(String stationTo) {
		this.stationTo = stationTo;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getHelperName() {
		return helperName;
	}

	public void setHelperName(String helperName) {
		this.helperName = helperName;
	}

	public String getHelperContact() {
		return helperContact;
	}

	public void setHelperContact(String helperContact) {
		this.helperContact = helperContact;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
		

}
