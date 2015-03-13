package com.soen341.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soen341.dao.RegHistoryDao;
import com.soen341.model.Course;
import com.soen341.model.RegHistory;
import com.soen341.model.SequenceMember;
import com.soen341.model.Student;
import com.soen341.service.RegHistoryService;
import com.soen341.service.SequenceService;
import com.soen341.service.StudentService;
import com.soen341.service.CourseService;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Provides implementation for services around the {@link RegHistory} entity.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Service("regHistoryService")
public class RegHistoryServiceImpl implements RegHistoryService
{
	@Autowired
	private RegHistoryDao regHistoryDao;

	@Autowired
	private SequenceService sequenceService;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;

	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying RegHistoryDao implementation to be used by the services.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public void setRegHistoryDao(RegHistoryDao regHistoryDao)
	{
		this.regHistoryDao = regHistoryDao;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<Course> getCompleted(String studentId)
	{
		List<Course> completedCourses = new ArrayList<Course>();
		List<RegHistory> registrationHistoryList = regHistoryDao.loadCompleted(studentId);

		// retrieve courses from the registration history list
		for (RegHistory record : registrationHistoryList)
		{
			completedCourses.add(record.getCourse());
		}

		return completedCourses;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<RegHistory> getRegistered(String studentId)
	{
		return regHistoryDao.loadRegistered(studentId);

	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<Course> getAvailable(String studentId)
	{
		// get sequenceId for the given studentId
		Student student = studentService.loadStudentById(studentId);
		String sequenceId = student.getSequenceId();

		// create an empty list to store courses available for registration
		List<Course> availableCourses = new ArrayList<Course>();

		boolean addElectives = false;
		
		// retrieve all courses from the sequence
		List<SequenceMember> sequence = sequenceService.loadBySequenceId(sequenceId);
		for (SequenceMember member : sequence){
			
			if(member.getCourse().getCourseName().equals("Elective Course")){
				addElectives = true;
			}
			
			else {
				availableCourses.add(member.getCourse());
			}

		}
		
		if (addElectives == true){
			List<Course> electives = courseService.getElectiveCourses(true);
			
			for (Course courseMember : electives){
				availableCourses.add(courseMember);
			}
		}
		
		// get all previously registered/completed courses
		List<RegHistory> courseRegHistory = regHistoryDao.loadAll(studentId);

		// filter registered/completed courses from the list of courses defined by the sequence
		for (RegHistory registeredCourse : courseRegHistory)
		{
			Course course = registeredCourse.getCourse();
			if (availableCourses.contains(course))
				availableCourses.remove(course);
		}

		return availableCourses;
	}
}
