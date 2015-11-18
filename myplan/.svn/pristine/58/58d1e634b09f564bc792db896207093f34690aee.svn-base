package wts.myplan.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Terms")
public class TermsVO implements Serializable {

	
	private Integer termId;
	private String endDate;
	private String startDate;
	private String note;
	private String title;
	private Integer minutesForWeekday;
	private Integer minutesForWeekend;
	private Integer totalMinutes;
	private Integer noOfWeekdays;
	private Integer noOfWeekends;
	private String userEmail;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="TermId")
	public Integer getTermId() {
		return termId;
	}
	public void setTermId(Integer termId) {
		this.termId = termId;
	}
	@Column(name="EndDate")
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Column(name="StartDate")
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	@Column(name="Note")
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Column(name="Title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	@Column(name="MinutesForWeekday")
	public Integer getMinutesForWeekday() {
		return minutesForWeekday;
	}
	public void setMinutesForWeekday(Integer minutesForWeekday) {
		this.minutesForWeekday = minutesForWeekday;
	}
	@Column(name="MinutesForWeekend")
	public Integer getMinutesForWeekend() {
		return minutesForWeekend;
	}
	public void setMinutesForWeekend(Integer minutesForWeekend) {
		this.minutesForWeekend = minutesForWeekend;
	}
	@Column(name="TotalMinutes")
	public Integer getTotalMinutes() {
		return totalMinutes;
	}
	public void setTotalMinutes(Integer totalMinutes) {
		this.totalMinutes = totalMinutes;
	}
	@Column(name="NoOfWeekdays")
	public Integer getNoOfWeekdays() {
		return noOfWeekdays;
	}
	public void setNoOfWeekdays(Integer noOfWeekdays) {
		this.noOfWeekdays = noOfWeekdays;
	}
	@Column(name="NoOfWeekends")
	public Integer getNoOfWeekends() {
		return noOfWeekends;
	}
	public void setNoOfWeekends(Integer noOfWeekends) {
		this.noOfWeekends = noOfWeekends;
	}
	@Column(name="UserEmail")
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
		result = prime * result + ((termId == null) ? 0 : termId.hashCode());
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
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
		TermsVO other = (TermsVO) obj;
		if (termId == null) {
			if (other.termId != null)
				return false;
		} else if (!termId.equals(other.termId))
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
			return false;
		return true;
	}
	
	
	

	

	

}
