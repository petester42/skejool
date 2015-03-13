package com.soen341.service;

import java.util.List;

import com.soen341.model.Course;
import com.soen341.model.RegHistory;

public interface RegHistoryService
{
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a list of completed courses
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<Course> getCompleted(String studentId);

	
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a list of registered courses
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<RegHistory> getRegistered(String studentId);


	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a list of courses available for registration
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<Course> getAvailable(String studentId);
}