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

//import com.soen341.model.enums.SemesterEnum;
 
//--------------------------------------------------------------------------------------------------------------------------------
/**
* Model class for SequenceMember
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Entity
@Table(name = "sequenceMember")
@NamedQueries(
		{
			@NamedQuery(name = "getSequence",
			query = "SELECT s FROM SequenceMember s where s.sequenceId=:sequenceId  order by s.id")
		})

public class SequenceMember implements Serializable
{
	private static final long serialVersionUID = 1L;	// Default serial version ID

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private Long id;

	@Column(name="sequenceId")
	private String sequenceId;

	@Column(name="semester")
	private int semester;

	@Column(name="courseYear")	// can be 1 (1st), 2 (2nd), 3 (third) or 4 (4th)
	private int courseYear;

	@OneToOne
	@JoinColumn(name = "courseId")
	private Course course;

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Constructor.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public SequenceMember()
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
	public String getSequenceId()
	{
		return sequenceId;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setSequenceId(String code)
	{
		this.sequenceId = code;
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
	public int getCourseYear()
	{
		return courseYear;
	}
	// --------------------------------------------------------------------------------------------------------------------------------
	public void setCourseYear(int courseYear)
	{
		this.courseYear = courseYear;
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
}