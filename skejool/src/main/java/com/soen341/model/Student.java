package com.soen341.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import com.soen341.model.enums.ProgramEnum;

//--------------------------------------------------------------------------------------------------------------------------------
/**
 * Model class for Student
 */
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "student")
@NamedQueries(
	{
		@NamedQuery(name = "Student.getByStudentId",
		query = "SELECT s FROM Student s where s.studentId=:studentId")
	})
public class Student implements Serializable
{
	 // Default serial version ID
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="studentId")
	private String studentId;

	@Column(name="barcode")
	private String barcode;

	@Column(name="password")
	private String password;

	@Column(name="firstName")
	private String firstName;

	@Column(name="secondName")
	private String secondName;

	@Column(name="program")
	private ProgramEnum program;

	@Column(name="programOption")
	private String programOption;

	@Column(name="registrationDate")
	@Temporal(TemporalType.DATE)
	private Date registrationDate;

	@Column(name="minCredits")
	private Double minCredits;
	
	@Column(name="sequenceId")
	private String sequenceId;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Student()
	{
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
	public String getBarcode()
	{
		return barcode;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setBarcode(String barcode)
	{
		this.barcode = barcode;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getPassword()
	{
		return password;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setPassword(String password)
	{
		this.password = password;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public String getFirstName()
	{
		return firstName;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getSecondName()
	{
		return secondName;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSecondName(String secondName)
	{
		this.secondName = secondName;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public ProgramEnum getProgram()
	{
		return program;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setProgram(ProgramEnum program)
	{
		this.program = program;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public String getProgramOption()
	{
		return programOption;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setProgramOption(String programOption)
	{
		this.programOption = programOption;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Date getRegistrationDate()
	{
		return registrationDate;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setRegistrationDate(Date registrationDate)
	{
		this.registrationDate = registrationDate;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	public Double getMinCredits()
	{
		return minCredits;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setMinCredits(Double minCredits)
	{
		this.minCredits = minCredits;
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