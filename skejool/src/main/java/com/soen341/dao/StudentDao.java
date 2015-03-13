package com.soen341.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import com.soen341.model.Student;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Student DAO concrete implementation.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Repository("studentDao")
public class StudentDao
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
	public Student loadStudent(String studentId)
	{
		Student student = null;

		Query queryLoadStudent = entityManager.createNamedQuery("Student.getByStudentId");
		queryLoadStudent.setParameter("studentId", studentId);

		List<Student> students = queryLoadStudent.getResultList();

		if(students.size() > 0)
		{
			student = students.get(0);
		}

		return student;
	}
}
