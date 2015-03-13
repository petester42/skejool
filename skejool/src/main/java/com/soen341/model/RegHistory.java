package com.soen341.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//--------------------------------------------------------------------------------------------------------------------------------
/**
 * Model class for Registration History
 */
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@NamedQueries(
		{
			@NamedQuery(name = "getCompleted",
			query = "SELECT r FROM RegHistory r where r.studentId=:studentId and r.completed=:completed order by r.id"),
			@NamedQuery(name = "getRegistered",
			query = "SELECT r FROM RegHistory r where r.studentId=:studentId and r.registered=:registered order by r.id"),
			@NamedQuery(name = "getAll",
			query = "SELECT r FROM RegHistory r where r.studentId=:studentId order by r.id")
		})
@Table(name = "reghistory")
public class RegHistory implements Serializable
{
	 // Default serial version ID
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private Long id;

	@Column(name = "studentId")
	private String studentId;

	@OneToOne
	@JoinColumn(name = "courseId")
	private Course course;

	@Column(name="registered")
	private Boolean registered;

	@Column(name="completed")
	private Boolean completed;
	

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public RegHistory()
	{
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Long getId()
	{
		return id;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setId(Long id)
	{
		this.id = id;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getStudent()
	{
		return studentId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setStudent(String id)
	{
		this.studentId = id;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Course getCourse()
	{
		return course;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourse(Course course)
	{
		this.course = course;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Boolean getRegistred()
	{
		return registered;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setRegistred(Boolean registered)
	{
		this.registered = registered;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Boolean getCompleted()
	{
		return completed;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCompleted(Boolean completed)
	{
		this.completed = completed;
	}
}