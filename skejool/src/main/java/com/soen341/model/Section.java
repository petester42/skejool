package com.soen341.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Section
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "section")
public class Section implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@Column(name="sectionId")
	private String sectionId;

	@Column(name="semester")
	private int semester;

	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="sectionId")
	private List<TimeSlot> timeSlots;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Section()
	{
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public String getSectionId()
	{
		return sectionId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSectionId(String sectionId)
	{
		this.sectionId = sectionId;
	}

	
	// --------------------------------------------------------------------------------------------------------------------------------
	public int getSemester()
	{
		return semester;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSemester(int semester)
	{
		this.semester = semester;
	}

	
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<TimeSlot> getTimeSlots()
	{
		return timeSlots;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setTimeSlots(List<TimeSlot> timeSlots)
	{
		this.timeSlots = timeSlots;
	}
}