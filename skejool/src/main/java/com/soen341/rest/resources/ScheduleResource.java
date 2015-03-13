package com.soen341.rest.resources;

//import javax.ws.rs.Consumes;
import java.util.Collection;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.soen341.model.Constraints;
import com.soen341.model.Schedule;
import com.soen341.service.ScheduleService;

//--------------------------------------------------------------------------------------------------------------------------------
@Component
@Path("schedules")
@Scope("request")
public class ScheduleResource
{
	@Autowired
	ScheduleService scheduleService;

	// ----------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying ScheduleServices implementation to be used by the resource.
	 */
	// ----------------------------------------------------------------------------------------------
	public void setScheduleServices(ScheduleService scheduleService)
	{
		this.scheduleService = scheduleService;
	}

	// ----------------------------------------------------------------------------------------------
	@POST
	@Path("/generate")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Collection<Schedule> generateSchedules(Constraints constraints)
	{
			return scheduleService.generateSchedule(constraints);
	}

	// ----------------------------------------------------------------------------------------------
	@POST
	@Path("/saveById/{scheduleId}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean saveSchedule(@PathParam("scheduleId") String scheduleId)
	{
		return scheduleService.saveScheduleById(scheduleId);
	}

	// ----------------------------------------------------------------------------------------------
	@GET
	@Path("/getById/{scheduleId}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Schedule generateSchedules(@PathParam("scheduleId") String scheduleId)
	{
		return scheduleService.getScheduleById(scheduleId);
	}
}
