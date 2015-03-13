package com.soen341.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for ScheduleMember
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "scheduleMember")
public class ScheduleMember implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="scheduleMemberId")
	private String scheduleMemberId;

	@Column(name="courseCode")
	private String courseCode;

	@ManyToOne
	@JoinColumn(name = "scheduleId")
	private Schedule scheduleId;

	@OneToOne(fetch = FetchType.EAGER )
	@JoinColumn(name="sectionId")
	private Section section;


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public ScheduleMember()
	{
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public String getScheduleMemberId()
	{
		return scheduleMemberId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setScheduleMemberId(String scheduleMemberId)
	{
		this.scheduleMemberId = scheduleMemberId;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getCourseCode()
	{
		return courseCode;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourseCode(String courseCode)
	{
		this.courseCode = courseCode;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Section getSection()
	{
		return section;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSection(Section section)
	{
		this.section = section;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	@JsonIgnore
	public Schedule getSchedule()
	{
		return scheduleId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSchedule(Schedule id)
	{
		this.scheduleId = id;
	}
}