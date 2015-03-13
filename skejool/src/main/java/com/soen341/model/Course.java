package com.soen341.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Course
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "course")
@NamedQueries(
		{
			@NamedQuery(name = "getElectives",
			query = "SELECT c FROM Course c where c.elective=:electiveId")
		})
public class Course
{
	@Id
	@Column(name="courseId")
	private String courseId;
	
	@Column(name="courseName")
	private String courseName;

	@Column(name="courseDescription")
	private String courseDescription;

	@Column(name="credits")
	private Double credits;

	@Column(name="elective")
	private Boolean elective;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="courseId")
	private Set<Prerequisite> prerequisites;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="courseId")
	private Set<Corequisite> corequisites;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="courseId")
	private Set<Section> sections;


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Course()
	{
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------

	public String getCourseId()
	{
		return courseId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourseId(String course)
	{
		this.courseId = course;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getCourseName()
	{
		return courseName;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourseName(String courseName)
	{
		this.courseName = courseName;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getCourseDescription()
	{
		return courseDescription;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourseDescription(String courseDescription)
	{
		this.courseDescription = courseDescription;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Double getCredits()
	{
		return credits;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCredits(Double credits)
	{
		this.credits = credits;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Boolean getElective()
	{
		return elective;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setElective(Boolean elective)
	{
		this.elective = elective;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Set<Prerequisite> getPrerequisites()
	{
		return prerequisites;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setPrerequisites(Set<Prerequisite> prerequisites)
	{
		this.prerequisites = prerequisites;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Set<Corequisite> getCorequisites()
	{
		return corequisites;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCorequisites(Set<Corequisite> corequisites)
	{
		this.corequisites = corequisites;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Set<Section> getSections()
	{
		return sections;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSections(Set<Section> sections)
	{
		this.sections = sections;
	}
}