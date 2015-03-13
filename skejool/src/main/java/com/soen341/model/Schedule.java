package com.soen341.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Schedule
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "schedule")
@NamedQueries(
		{
			@NamedQuery(name = "getScheduleById",
			query = "SELECT s FROM Schedule s where s.id=:scheduleId")
		})
public class Schedule implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id")
	private String id;

	@Column(name="studentId")
	private String studentId;

	@OneToMany(mappedBy="scheduleId",
			targetEntity=ScheduleMember.class,
			fetch=FetchType.EAGER,
			cascade=CascadeType.PERSIST)
	private List<ScheduleMember> scheduleMembers;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Schedule()
	{
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	@JsonIgnore
	public String getId()
	{
		return id;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setId(String id)
	{
		this.id = id;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getStudentId()
	{
		return studentId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	@JsonIgnore
	public List<ScheduleMember> getScheduleMembers()
	{
		return scheduleMembers;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setScheduleMembers(List<ScheduleMember> scheduleMembers)
	{
		this.scheduleMembers = scheduleMembers;
	}
}