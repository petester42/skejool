package com.soen341.rest.resources;

//import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.soen341.model.Course;
import com.soen341.service.CourseService;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("courses")
@Scope("request")
public class CourseResource
{
	@Autowired
	CourseService courseService;

	// ----------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying UserServices implementation to be used by the resource.
	 */
	// ----------------------------------------------------------------------------------------------
	public void setCourseServices(CourseService courseService)
	{
		this.courseService = courseService;
	}


	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves the matching student resource (JSON content) according to the specified student ID.
	 * Tomcat/Jetty URL: http://localhost:8080/skejool/students/{student ID}.
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Course getById(@PathParam("courseId") String courseId)
	{
		return courseService.getCourseById(courseId);
	}
}
