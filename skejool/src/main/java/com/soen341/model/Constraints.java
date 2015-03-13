package com.soen341.model;

import java.util.ArrayList;
import java.util.List;

//--------------------------------------------------------------------------------------------------------------------------------
/**
 * Model class for Constraints
 */
//--------------------------------------------------------------------------------------------------------------------------------

public class Constraints
{
	private String studentId;
	private Long maxCredits;
	private Long minCredits;
	private List<TimeConstraint> timeConstraints;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructors.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Constraints()
	{
	}

	// allows a deep copy of the Constraints object
	public Constraints(Constraints constraints)
	{
		this.studentId = constraints.getStudentId();
		this.maxCredits = constraints.getMaxCredits();
		this.minCredits = constraints.getMinCredits();

		List<TimeConstraint> oldList = constraints.getTimeConstraints();
		List<TimeConstraint> newList = new ArrayList<TimeConstraint>(constraints.getTimeConstraints().size() * 5);
		for (TimeConstraint timeConstraint : oldList)
		{
			newList.add(new TimeConstraint(timeConstraint));
		}

		this.timeConstraints = newList;
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
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
	public Long getMaxCredits()
	{
		return maxCredits;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setMaxCredits(Long max)
	{
		this.maxCredits = max;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Long getMinCredits()
	{
		return minCredits;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setMinCredits(Long min)
	{
		this.minCredits = min;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public List<TimeConstraint> getTimeConstraints()
	{
		return timeConstraints;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setTimeConstraints(List<TimeConstraint> time)
	{
		this.timeConstraints = time;
	}

}