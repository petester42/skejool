package com.soen341.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soen341.dao.StudentDao;
import com.soen341.model.Student;
import com.soen341.rest.resources.exceptions.NotFoundException;
import com.soen341.service.StudentService;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Provides implementation for services around the {@link Student} entity.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Service("studentService")
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentDao studentDao;

//	@Autowired
//	private RegistrationHistoryDao regHistoryDao;

	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying StudentDao implementation to be used by the services.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public void setStudentDao(StudentDao studentDao)
	{
		this.studentDao = studentDao;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public Student loadStudentById(String studentId)
	{
		Student studentEntity;
		if ((studentEntity = studentDao.loadStudent(studentId)) == null)
			throw new NotFoundException(String.format("Student with ID '%s' not found", studentId));

		return studentEntity;
	}

	// -------------------------------------------------------------------------------
	public Student loadRegisteredCourses(String studentId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	// -------------------------------------------------------------------------------
	public Student loadCompletedCourses(String studentId)
	{
		// TODO Auto-generated method stub
		return null;
	}
}
