package com.soen341.model;

import com.soen341.model.enums.DayOfWeekEnum;

//--------------------------------------------------------------------------------------------------------------------------------
/**
 * Model class for TimeConstraint
 */
//--------------------------------------------------------------------------------------------------------------------------------

public class TimeConstraint
{
	private DayOfWeekEnum dayOfWeek;
	private String startTime;
	private String endTime;	

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructors.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public TimeConstraint()
	{
	}

	// allows collection clones
	public TimeConstraint(TimeConstraint constraint)
	{
		this.dayOfWeek = constraint.dayOfWeek;
		this.startTime = constraint.startTime;
		this.endTime = constraint.endTime;
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public DayOfWeekEnum getDayOfWeek()
	{
		return dayOfWeek;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setDayOfWeek(DayOfWeekEnum day)
	{
		this.dayOfWeek = day;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getStartTime()
	{
		return startTime;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getEndTime()
	{
		return endTime;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}
}