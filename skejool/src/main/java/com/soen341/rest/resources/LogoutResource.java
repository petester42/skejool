package com.soen341.rest.resources;

//import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
//import javax.ws.rs.POST;
import javax.ws.rs.Path;

import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("welcome")
@Scope("request")
public class LogoutResource
{
	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves the matching student resource (JSON content) according to the specified student ID.
	 * Tomcat/Jetty URL: http://localhost:8080/skejool/students/{student ID}.
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/bye")
	@Produces(MediaType.TEXT_HTML)
	public String getById()
	{
		return "goodbye";
	}
}
