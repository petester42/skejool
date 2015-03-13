package com.soen341.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.soen341.model.enums.ClassTypeEnum;
import com.soen341.model.enums.DayOfWeekEnum;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for TimeSlots
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "timeslot")
public class TimeSlot implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@GeneratedValue
	@Column(name="timeSlotId")
	private Long timeSlotId;

	@Column(name="classType")
	@Enumerated(EnumType.STRING)
	private ClassTypeEnum classType;

	@Column(name="dayOfWeek")
	@Enumerated(EnumType.STRING)
	private DayOfWeekEnum dayOfWeek;

	@Column(name="startTime")
	@Temporal(TemporalType.TIME)
	private Date startTime;

	@Column(name="endTime")
	@Temporal(TemporalType.TIME)
	private Date endTime;
	
	@Column(name="sectionName")
	private String sectionName;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public TimeSlot()
	{
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------

	public Long getTimeslotId()
	{
		return timeSlotId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setTimeslotId(Long id)
	{
		this.timeSlotId = id;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public ClassTypeEnum getClassType()
	{
		return classType;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setClassType(ClassTypeEnum classType)
	{
		this.classType = classType;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public DayOfWeekEnum getDayOfWeek()
	{
		return dayOfWeek;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setDayOfWeek(DayOfWeekEnum dayOfWeek)
	{
		this.dayOfWeek = dayOfWeek;
	}

	
	// --------------------------------------------------------------------------------------------------------------------------------
	public Date getStartTime()
	{
		return startTime;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setStartTime(Date startTime)
	{
		this.startTime = startTime;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Date getEndTime()
	{
		return endTime;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setEndTime(Date endTime)
	{
		this.endTime = endTime;
	}
	
	// --------------------------------------------------------------------------------------------------------------------------------
	public String getSectionName()
	{
		return sectionName;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSectionName(String sectionName)
	{
		this.sectionName = sectionName;
	}
	
}