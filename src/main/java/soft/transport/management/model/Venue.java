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
@Table(name="venue")
public class Venue {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	int id;
	
	@Column(name="venueName")
	String venueName;
	
	@Column(name="locationMap")
	String locationMap;
	
	@Transient
	int tmpId;
	
	public Venue() {
		
	}

	public Venue(int id, String venueName, String locationMap) {
		//super();
		this.id = id;
		this.venueName = venueName;
		this.locationMap = locationMap;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getLocationMap() {
		return locationMap;
	}

	public void setLocationMap(String locationMap) {
		this.locationMap = locationMap;
	}
	
	
	public int getTmpId() {
		return tmpId;
	}

	public void setTmpId(int tmpId) {
		this.tmpId = tmpId;
	}

	@Override
	public String toString() {
		return "Venue [id=" + id + ", Venue Name=" + venueName + ", Location Map="+locationMap+"]";
	}/*end*/

	

}
