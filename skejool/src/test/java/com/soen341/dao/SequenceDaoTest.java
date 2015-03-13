package com.soen341.dao;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;

import javax.persistence.EntityManager;

import org.junit.Test;

//--------------------------------------------------------------------------------------------------------------------------------
public class SequenceDaoTest
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

		SequenceDao instance = new SequenceDao();
		instance.setEntityManager(entityManager);

		assertEquals(entityManager, instance.getEntityManager());
	}

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Tests loadSequence
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
/*	@Test
	public void testLoadSequence()
	{
		String sequenceKey = "";
		EntityManager entityManager = new EntityManager();

		Sequence sequence = entityManager.find(Sequence.class, sequenceId);

		// verify if the correct object is returned
		assertEquals(mockStudent, studentDao.loadStudent("testId"));
		assertEquals("testBarCode", studentDao.loadStudent("testId").getBarcode());
	}
	*/
}