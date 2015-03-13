
package com.soen341.rest.resources.exceptions;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import com.sun.jersey.api.Responses;

public class AuthenticationException extends WebApplicationException
{
	private static final long serialVersionUID = 1L;

	// --------------------------------------------------------------------------------------------------------------------------------
	// Create a HTTP 406 (Not Acceptable) exception.
	//---------------------------------------------------------------------------------------------------------------------------------
	public AuthenticationException()
	{
		super(Responses.notAcceptable().build());
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	// Create a HTTP 406 (Not Acceptable) exception.
	// @param message the String that is the entity of the 406 response.
	//--------------------------------------------------------------------------------------------------------------------------------
	public AuthenticationException(String message)
	{
		super(Response.status(Responses.NOT_ACCEPTABLE).entity(message).type("text/plain").build());
	}
}
