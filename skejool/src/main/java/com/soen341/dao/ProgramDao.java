package com.soen341.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.soen341.model.Program;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Program DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("programDao")
public class ProgramDao
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
	public Program loadProgram(String programId)
	{
		Program program = null;

		Query queryLoadProgram = entityManager.createNamedQuery("getProgram");
		queryLoadProgram.setParameter("programId", programId);

		List<Program> programs = queryLoadProgram.getResultList();

		if(programs.size() > 0)
		{
			program = programs.get(0);
		}

		return program;
	}
}
