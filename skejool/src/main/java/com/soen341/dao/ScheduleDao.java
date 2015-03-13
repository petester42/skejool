package com.soen341.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.soen341.model.Schedule;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Schedule DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("scheduleDao")
public class ScheduleDao
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
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	public boolean saveSchedule(Schedule schedule)
	{

		entityManager.persist(schedule);
		entityManager.flush();

		return true;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly=true)
	public Schedule getById(String scheduleId)
	{
		Schedule schedule = entityManager.find(Schedule.class, scheduleId);
		return schedule;
	}
}
