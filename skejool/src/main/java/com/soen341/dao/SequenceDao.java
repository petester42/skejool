package com.soen341.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import com.soen341.model.SequenceMember;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Sequence DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("sequenceDao")
public class SequenceDao
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
	public List<SequenceMember> loadSequenceMembers(String sequenceId)
	{	
		Query queryLoadSequence = entityManager.createNamedQuery("getSequence");
		queryLoadSequence.setParameter("sequenceId", sequenceId);

		List<SequenceMember> sequenceMembers = queryLoadSequence.getResultList(); 

		return sequenceMembers;
	}
}
