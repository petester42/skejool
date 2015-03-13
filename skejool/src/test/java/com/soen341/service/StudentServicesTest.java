package com.soen341.service;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.soen341.dao.StudentDao;
import com.soen341.model.Student;
import com.soen341.rest.resources.exceptions.NotFoundException;
import com.soen341.service.impl.StudentServiceImpl;

//--------------------------------------------------------------------------------------------------------------------------------
public class StudentServicesTest
{
	private StudentDao studentDao;
	private StudentServiceImpl studentService;
	private Student mockStudent;

	// --------------------------------------------------------------------------------------------------------------------------------
	// Setup
	// --------------------------------------------------------------------------------------------------------------------------------
	@Before
	public void setUp()
	{
		//initialize
		studentDao = mock(StudentDao.class);
		studentService = new StudentServiceImpl();
		studentService.setStudentDao(studentDao);
		mockStudent = new Student();

		// set fields
        mockStudent.setStudentId("1111111");
        mockStudent.setBarcode("111111111111");
        mockStudent.setPassword("password");
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	// Clean up
	// --------------------------------------------------------------------------------------------------------------------------------
	@After
	public void cleanUp()
	{
		studentDao = null;
		studentService = null;
		mockStudent = null;
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Verifies successful loadProfile
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	@Test
	public void successfulLoadProfile()
	{
        // return mock object when loadProfile(ID) is called
		when(studentDao.loadStudent(mockStudent.getStudentId())).thenReturn(mockStudent);

		Student student = studentService.loadStudentById(mockStudent.getStudentId());

		assertEquals(mockStudent, student);
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Verifies unsuccessful load Profile
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	@Test(expected = NotFoundException.class)
	public void failingLoadProfile()
	{
		// return null when loadProfile(ID) is called
		StudentDao studentDao = mock(StudentDao.class);
		when(studentDao.loadStudent(mockStudent.getStudentId())).thenReturn(null);

		studentService.loadStudentById(mockStudent.getStudentId());
	}
}