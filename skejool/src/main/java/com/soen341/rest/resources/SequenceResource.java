package com.soen341.rest.resources;

//import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

//import com.soen341.model.SequenceMember;
import com.soen341.service.SequenceService;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("sequence")
@Scope("request")
public class SequenceResource
{
	@Autowired
	SequenceService sequenceService;

	// ----------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying course sequence services implementation to be used by the resource.
	 */
	// ----------------------------------------------------------------------------------------------
	public void setSequenceServices(SequenceService sequenceService)
	{
		this.sequenceService = sequenceService;
	}


	// ----------------------------------------------------------------------------------------------
	/**
	 * Retrieves a collection of courses (JSON content) according to the specified sequence ID.
	 */
	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("bySequenceId/{sequenceId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Map<String,Object>> getSequenceMembersById(@PathParam("sequenceId") String sequenceId)
	{
		List<Map<String,Object>> sequence= sequenceService.sortSequence(sequenceId);
         
		return sequence;
	}
}
