package com.soen341.service;

import com.soen341.model.Student;

public interface StudentService
{

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns student profile object according to  a specified Student ID.
	 * Returns a DataNotFoundException upon failing to load the requested profile.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Student loadStudentById(String studentId);

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a collection of courses the student is currently
	 * registered to according to specified Student ID.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Student loadRegisteredCourses(String studentId);

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a collection of completed courses for a student
	 * according to specified Student ID.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public Student loadCompletedCourses(String studentId);
}