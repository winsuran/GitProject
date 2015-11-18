
package wts.myplan.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name = "dailyprogress")
public class DailyProgressVO implements Serializable {


	
	private String spendDates;

	
	private Integer subjectId;
	
	

	@Column(name = " spendMinutes")
	private Integer spendMinutes;
	
	private DailyProgressPK dailyProgressPK;
	
	
	@EmbeddedId	
	public DailyProgressPK getDailyProgressPK() {
		if(dailyProgressPK==null){
			dailyProgressPK=new DailyProgressPK(this.spendDates,this.subjectId);
		}
		return dailyProgressPK;
	}

	public void setDailyProgressPK(DailyProgressPK dailyProgressPK) {
		if(dailyProgressPK!=null){
			this.spendDates=dailyProgressPK.getSpendDates();
			this.subjectId=dailyProgressPK.getSubjectId();
			
		}
		this.dailyProgressPK = dailyProgressPK;
	}
	
	
	@Column(name = "SpendDates",insertable=false,updatable=false)
	public String getSpendDates() {
		return spendDates;
	}

	public void setSpendDates(String spendDates) {
		this.spendDates = spendDates;
	}
	
	
	@Column(name = "SubjectId",insertable=false,updatable=false)
	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getSpendMinutes() {
		return spendMinutes;
	}

	public void setSpendMinutes(Integer spendMinutes) {
		this.spendMinutes = spendMinutes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((spendDates == null) ? 0 : spendDates.hashCode());
		result = prime * result + ((subjectId == null) ? 0 : subjectId.hashCode());
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
		DailyProgressVO other = (DailyProgressVO) obj;
		if (spendDates == null) {
			if (other.spendDates != null)
				return false;
		} else if (!spendDates.equals(other.spendDates))
			return false;
		if (subjectId == null) {
			if (other.subjectId != null)
				return false;
		} else if (!subjectId.equals(other.subjectId))
			return false;
		return true;
	}

}
