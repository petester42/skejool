package com.soen341.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Corequisite
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "corequisite")
public class Corequisite implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@Column(name="id")
	private Long id;

	@Column(name="corequisiteId")
	private String corequisiteId;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Corequisite()
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
	public String getCorequisiteId()
	{
		return corequisiteId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCorequisiteId(String corequisiteId)
	{
		this.corequisiteId = corequisiteId;
	}
}