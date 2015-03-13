package com.soen341.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Prerequisite
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "prerequisite")
public class Prerequisite implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@Column(name="id")
	private Long id;
	
	@Column(name="prerequisiteId")
	private String prerequisiteId;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Prerequisite()
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
	public String getPrerequisiteId()
	{
		return prerequisiteId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setPrerequisiteId(String prerequisiteId)
	{
		this.prerequisiteId = prerequisiteId;
	}
}