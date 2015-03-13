package com.soen341.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.soen341.model.RegHistory;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* RegHistory DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("regHistoryDao")
public class RegHistoryDao
{
	private EntityManager entityManager;

	// -------------------------------------------------------------------------------
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager)
	{
		this.entityManager = entityManager;
	}

	// -------------------------------------------------------------------------------
	public EntityManager getEntityManager()
	{
		return entityManager;
	}

	// -------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<RegHistory> loadCompleted(String studentId)
	{
		Query queryLoadCompleted = entityManager.createNamedQuery("getCompleted");
		queryLoadCompleted.setParameter("studentId", studentId);
		queryLoadCompleted.setParameter("completed", true);

		List<RegHistory> completedCourses = queryLoadCompleted.getResultList(); 

		return completedCourses;
	}

	// -------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<RegHistory> loadRegistered(String studentId)
	{
		Query queryLoadRegistered = entityManager.createNamedQuery("getRegistered");
		queryLoadRegistered.setParameter("studentId", studentId);
		queryLoadRegistered.setParameter("registered", true);

		List<RegHistory> registeredCourses = queryLoadRegistered.getResultList(); 

		return registeredCourses;
	}

	// -------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<RegHistory> loadAll(String studentId)
	{
		Query queryLoadAll = entityManager.createNamedQuery("getAll");
		queryLoadAll.setParameter("studentId", studentId);

		List<RegHistory> allCourses = queryLoadAll.getResultList(); 

		return allCourses;
	}
}




/*
 * LOOK AT THE EXAMPLE
	// -------------------------------------------------------------------------------
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	public boolean save(Person person)
	{

		entityManager.persist(person);
		entityManager.flush();

		return true;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	public boolean update(Person person)
	{
		entityManager.merge(person);
		entityManager.flush();
		return true;
	}
 */
