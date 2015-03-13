package com.soen341.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soen341.dao.CourseDao;
import com.soen341.dao.RegHistoryDao;
import com.soen341.model.Course;
import com.soen341.model.Student;
import com.soen341.service.CourseService;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Provides implementation for services around the {@link Student} entity.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Service("courseService")
public class CourseServiceImpl implements CourseService
{
	@Autowired
	private CourseDao courseDao;

	@Autowired
	private RegHistoryDao regHistoryDao;

	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying StudentDao implementation to be used by the services.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public void setCourseDao(CourseDao courseDao)
	{
		this.courseDao = courseDao;
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying StudentDao implementation to be used by the services.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public void setregHistoryDao(RegHistoryDao regHistoryDao)
	{
		this.regHistoryDao = regHistoryDao;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public Course getCourseById(String courseId)
	{
		Course course = courseDao.getById(courseId);
		return course;
	}

	
	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<Course> getElectiveCourses(boolean electiveId){
		
		return courseDao.getElectives(electiveId);
	}
}
