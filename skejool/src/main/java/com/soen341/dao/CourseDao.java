package com.soen341.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.soen341.model.Course;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Student DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("courseDao")
public class CourseDao
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
	public Course getById(String courseId)
	{
		Course course = entityManager.find(Course.class, courseId);
		return course;
	}
	
	@SuppressWarnings("unchecked")
	public List<Course> getElectives(boolean electiveId){
		
		Query queryLoadElectives = entityManager.createNamedQuery("getElectives");
		queryLoadElectives.setParameter("electiveId", electiveId);

		List<Course> electives = queryLoadElectives.getResultList(); 

		return electives;
	}
	
}
