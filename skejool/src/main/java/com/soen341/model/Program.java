package com.soen341.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for Program
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "program")
@NamedQueries(
		{
			@NamedQuery(name = "getProgram",
			query = "SELECT p FROM Program p where p.programId=:programId")
		})
public class Program implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@Column(name="programId")
	private String programId;

	@Column(name="programName")
	private String programName;

	@Column(name="sequenceId")
	private String sequenceId;
	
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Program()
	{
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Setters and getters.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public String getProgramId()
	{
		return programId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setProgramId(String programId)
	{
		this.programId = programId;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getProgramName()
	{
		return programName;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setProgramName(String programName)
	{
		this.programName = programName;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getSequenceId()
	{
		return sequenceId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSequenceId(String sequenceId)
	{
		this.sequenceId = sequenceId;
	}
}