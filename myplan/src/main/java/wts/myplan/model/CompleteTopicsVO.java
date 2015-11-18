package wts.myplan.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CompleteTopics")
public class CompleteTopicsVO implements Serializable{

	
	@Id
	@Column(name="TopicName")
	private String topicName;
	
	@Column(name="SpendDates")
	private String spendDates;
	
	@Column(name="SubjectId")
	private Integer subjectId;
	
	@Column(name="TopicMinutes")
	private Integer topicMinutes;
	
	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getSpendDates() {
		return spendDates;
	}

	public void setSpendDates(String spendDates) {
		this.spendDates = spendDates;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getTopicMinutes() {
		return topicMinutes;
	}

	public void setTopicMinutes(Integer topicMinutes) {
		this.topicMinutes = topicMinutes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((spendDates == null) ? 0 : spendDates.hashCode());
		result = prime * result + ((subjectId == null) ? 0 : subjectId.hashCode());
		result = prime * result + ((topicName == null) ? 0 : topicName.hashCode());
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
		CompleteTopicsVO other = (CompleteTopicsVO) obj;
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
		if (topicName == null) {
			if (other.topicName != null)
				return false;
		} else if (!topicName.equals(other.topicName))
			return false;
		return true;
	}


	
	
}
