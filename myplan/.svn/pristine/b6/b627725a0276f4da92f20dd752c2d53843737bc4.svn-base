package wts.myplan.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dailyschedule")
public class DailyScheduleVO implements Serializable{

	
	private String eventName;
	private Integer forWeekday;
	private Integer forWeekend;	
	private String userEmail;
	
	
	
	@Id
	@Column(name="eventName")
	public String getEventName() {
		return eventName;
	}


	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	@Column(name="forWeekday")
	public Integer getForWeekday() {
		return forWeekday;
	}


	public void setForWeekday(Integer forWeekday) {
		this.forWeekday = forWeekday;
	}

	@Column(name="forWeekend")
	public Integer getForWeekend() {
		return forWeekend;
	}


	public void setForWeekend(Integer forWeekend) {
		this.forWeekend = forWeekend;
	}

	@Column(name="userEmail")
	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((eventName == null) ? 0 : eventName.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DailyScheduleVO other = (DailyScheduleVO) obj;
		if (eventName == null) {
			if (other.eventName != null)
				return false;
		} else if (!eventName.equals(other.eventName))
			return false;
		return true;
	}






	
	
	
	
	
	
}
