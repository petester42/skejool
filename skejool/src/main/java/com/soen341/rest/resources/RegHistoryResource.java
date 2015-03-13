package com.soen341.rest.resources;

import java.util.Collection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.soen341.model.Course;
import com.soen341.service.RegHistoryService;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("regHistory")
@Scope("request")
public class RegHistoryResource
{
	@Autowired
	RegHistoryService regService;

	// ----------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying registration history services implementation to be used by the resource.
	 */
	// ----------------------------------------------------------------------------------------------
	public void setRegHistoryServices(RegHistoryService service)
	{
		this.regService = service;
	}


	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves a collection of completed courses (JSON content).
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/completed/{studentId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Collection<Course> getCompletedCourses(@PathParam("studentId") String studentId)
	{
		return regService.getCompleted(studentId);
	}

	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves a collection of courses available for registration (JSON content).
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/available/{studentId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Collection<Course> getAvailableCourses(@PathParam("studentId") String studentId)
	{
		return regService.getAvailable(studentId);
	}
}
