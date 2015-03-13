package com.soen341.rest.resources;

//import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
//import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.soen341.model.Student;
import com.soen341.service.StudentService;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("students")
@Scope("request")
public class StudentResource
{
	@Autowired
	StudentService studentService;

	// ----------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying UserServices implementation to be used by the resource.
	 */
	// ----------------------------------------------------------------------------------------------
	public void setStudentServices(StudentService studentService)
	{
		this.studentService = studentService;
	}


	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves the matching student resource (JSON content) according to the specified student ID.
	 * Tomcat/Jetty URL: http://localhost:8080/skejool/students/{student ID}.
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/{studentId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Student getStudent(@PathParam("studentId") String studentId)
	{
		return studentService.loadStudentById(studentId);
	}
}
