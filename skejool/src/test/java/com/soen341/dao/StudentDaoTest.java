package com.soen341.dao;

import javax.persistence.EntityManager;
import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.spy;
import org.junit.Test;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import com.soen341.model.Student;

//--------------------------------------------------------------------------------------------------------------------------------
public class StudentDaoTest
{
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Tests EntityManager setters and getters
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	@Test
	public void testSetGetEntityManager()
	{
		EntityManager entityManager = mock(EntityManager.class);

		StudentDao instance = new StudentDao();
		instance.setEntityManager(entityManager);

		assertEquals(entityManager, instance.getEntityManager());
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Tests loadProfile
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	@Test
	public void testLoadProfile()
	{
		// create mock student profile
		final Student mockStudent = new Student();
		mockStudent.setStudentId("testId");
		mockStudent.setBarcode("testBarCode");

		// create mock entity manager
		EntityManager entityManager = mock(EntityManager.class);

		// spy DAO for the profile invocation
		StudentDao studentDao = spy(new StudentDao());
		studentDao.setEntityManager(entityManager);

		// return mock student when loadProfile() is invoked
		doAnswer(new Answer<Student>()
		{
			public Student answer(InvocationOnMock invocation)
			{
				return mockStudent;
			}
		}).when(studentDao).loadStudent(anyString());

		// verify if the correct object is returned
		assertEquals(mockStudent, studentDao.loadStudent("testId"));
		assertEquals("testBarCode", studentDao.loadStudent("testId").getBarcode());
	}
}