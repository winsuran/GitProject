package wts.myplan.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class DailyProgressPK implements Serializable{
	private String spendDates;
	private Integer subjectId;
	
	
	public DailyProgressPK(){
		
	}
	public DailyProgressPK(String spendDates,Integer subjectId){
		this.spendDates=spendDates;
		this.subjectId=subjectId;
		
	}
	@Column(name="spendDates",insertable=false,updatable=false)
	public String getSpendDates() {
		return spendDates;
	}
	public void setSpendDates(String spendDates) {
		
		this.spendDates = spendDates;
	}
	
	@Column(name="subjectId",insertable=false,updatable=false)
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
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
		DailyProgressPK other = (DailyProgressPK) obj;
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
