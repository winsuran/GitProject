package wts.myplan.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="Topics")
public class TopicsVO implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="TopicId", nullable=false, length=10)	
	private Integer topicId;
	
	@Column(name="SubjectId", nullable=false, length=10)	
	private Integer subjectId;
	
	@Column(name="Name", nullable=true, length=255)	
	private String name;
	
	
	@ManyToOne
	@JoinColumn(name="SubjectId",insertable=false,updatable=false)
	private SubjectsVO subjectsVO;
	
	
	public Integer getTopicId() {
		return topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public SubjectsVO getSubjectsVO() {
		return subjectsVO;
	}

	public void setSubjectsVO(SubjectsVO subjectsVO) {
		this.subjectsVO = subjectsVO;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
	
		result = prime * result + topicId;
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
		TopicsVO other = (TopicsVO) obj;
	
		
		if (topicId != other.topicId)
			return false;
		return true;
	}

	
	

}
