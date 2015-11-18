package wts.myplan.model;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;





@Entity
@Table(name="Subjects")
public class SubjectsVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="SubjectId")
	private Integer subjectId;
	
	@Column(name="TermId")
	private Integer termId;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="PriorityLevel")
	private Double priorityLevel;
	
	@Column(name="Color")
	private String color;
	
	@Column(name="TotalMinutes")
	private Integer totalMinutes;
	
	@Column(name="CompleteMinutes")
	private Integer completeMinutes;	
	
	@OneToMany(mappedBy = "subjectsVO",targetEntity=TopicsVO.class, cascade = CascadeType.ALL)
	@Column(name="SubjectId")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<TopicsVO> topicsVOs;
	
	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getTermId() {
		return termId;
	}

	public void setTermId(Integer termId) {
		this.termId = termId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPriorityLevel() {
		return priorityLevel;
	}

	public void setPriorityLevel(Double priorityLevel) {
		this.priorityLevel = priorityLevel;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getTotalMinutes() {
		return totalMinutes;
	}

	public void setTotalMinutes(Integer totalMinutes) {
		this.totalMinutes = totalMinutes;
	}

	public Integer getCompleteMinutes() {
		return completeMinutes;
	}

	public void setCompleteMinutes(Integer completeMinutes) {
		this.completeMinutes = completeMinutes;
	}
	

	public List<TopicsVO> getTopicsVOs() {
		return topicsVOs;
	}

	public void setTopicsVOs(List<TopicsVO> topicsVOs) {
		for (TopicsVO topicsVO : topicsVOs) {
			topicsVO.setSubjectsVO(this);
		}
		this.topicsVOs = topicsVOs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((subjectId == null) ? 0 : subjectId.hashCode());
		result = prime * result + ((termId == null) ? 0 : termId.hashCode());
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
		SubjectsVO other = (SubjectsVO) obj;
		if (subjectId == null) {
			if (other.subjectId != null)
				return false;
		} else if (!subjectId.equals(other.subjectId))
			return false;
		if (termId == null) {
			if (other.termId != null)
				return false;
		} else if (!termId.equals(other.termId))
			return false;
		return true;
	}

	
	
}