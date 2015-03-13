package com.soen341.model;

import java.util.Date;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.soen341.model.Student;
import com.soen341.model.enums.ProgramEnum;

//--------------------------------------------------------------------------------------------------------------------------------
public class CourseTest
{
	private Course testCourse;

	// --------------------------------------------------------------------------------------------------------------------------------
	@Before public void setup()
	{
		testCourse = new Course();
	}
	
	@After
	public void cleanUp()
	{
		testCourse = null;
	}
/*
	//--------------------------------------------------------------------------------------------------------------------------------
	@Test
	public void testConstructor()
	{
		Assert.assertNotNull(testStudent);
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetProfileId()
	{
		testStudent.setStudentId("testId");

		Assert.assertEquals("testId", testStudent.getStudentId());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetStudentId()
	{
		testStudent.setStudentId("12345678");

		Assert.assertEquals("12345678", testStudent.getStudentId());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetBarCode()
	{
		testStudent.setBarcode("123456789101112");

		Assert.assertEquals("123456789101112", testStudent.getBarcode());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetPassword()
	{
		testStudent.setPassword("testPassword");

		Assert.assertEquals("testPassword", testStudent.getPassword());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetFirstName()
	{
		testStudent.setFirstName("firstName");

		Assert.assertEquals("firstName", testStudent.getFirstName());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetSecondName()
	{
		testStudent.setSecondName("secondName");

		Assert.assertEquals("secondName", testStudent.getSecondName());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetProgram()
	{
		testStudent.setProgram(ProgramEnum.COMP);

		Assert.assertEquals(ProgramEnum.COMP, testStudent.getProgram());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetProgramOption()
	{
		testStudent.setProgramOption("Systems");

		Assert.assertEquals("Systems", testStudent.getProgramOption());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetGetRegistrationDate()
	{
		testStudent.setRegistrationDate(new Date(24-12-2007));

		Assert.assertEquals(new Date(24-12-2007), testStudent.getRegistrationDate());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@Test public void testSetMinCredits()
	{
		testStudent.setMinCredits(Double.valueOf(135.5));

		Assert.assertEquals(Double.valueOf(135.5), testStudent.getMinCredits());
	}
*/
}