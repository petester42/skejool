package com.soen341.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soen341.dao.ScheduleDao;
import com.soen341.model.Constraints;
import com.soen341.model.Course;
import com.soen341.model.Prerequisite;
import com.soen341.model.Schedule;
import com.soen341.model.ScheduleMember;
import com.soen341.model.Section;
import com.soen341.model.TimeConstraint;
import com.soen341.model.TimeSlot;
import com.soen341.model.enums.DayOfWeekEnum;
import com.soen341.service.RegHistoryService;
import com.soen341.service.ScheduleService;

//--------------------------------------------------------------------------------------------------------------------------------
/**
* Provides implementation for services around the {@link Schedule} entity.
*/
//--------------------------------------------------------------------------------------------------------------------------------
@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService
{
	@Autowired
	private RegHistoryService regHistoryService;

	@Autowired
	private ScheduleDao scheduleDao;

	
	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Saves Schedule object to the database.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public Boolean saveSchedule(Schedule schedule)
	{
		return scheduleDao.saveSchedule(schedule);
	}


	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Retrieves Schedule object from the temporary table (ScheduleTemp) by specified scheduleId
	 * and permanently saves it to the database.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public Boolean saveScheduleById(String scheduleId)
	{
		// TODO Auto-generated method stub
		return null;
	}


	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns Schedule object by specified scheduleId.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public Schedule getScheduleById(String scheduleId)
	{
		// TODO Auto-generated method stub
		return scheduleDao.getById(scheduleId);
	}


	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 	Returns a list of generated schedules for specified time ranges and credit limits.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------

	 /* DONE:
	 * 	Create empty schedule and assign it an ID.
	 * 	Create an empty set of schedule members (member = course name + section)
	 * 	Get the list of courses available for registration
	 * 	For each course in the list do:
	 * 		if prerequisites completed and total # of credits < limit (default=18) and less than 6 courses taken)
	 * 			for each course section do:
	 * 				for each section TimeSlot do:
	 * 					if section time slots (lecture, tutorial and lab) match constraint times
	 * 						- add course to the Schedule
	 * 						- modify constraint times accordingly
	 * Save Schedule in the database
	 * Return Schedule object
	 * 
	 * TODO: Generate multiple schedules
	 */

	public Set<Schedule> generateSchedule(Constraints userConstraints)
	{
		/*
		* schedule generator logic is located here
		*/

		Set<Schedule> schedules = new HashSet<Schedule>();

		//create Schedule
		Schedule schedule = new Schedule();
		schedule.setId("Sch01Sem01");		// should be revised if multiple schedules are generated
		schedule.setStudentId(userConstraints.getStudentId());

		// create new set of schedule members
		List<ScheduleMember> scheduleMembers = new ArrayList<ScheduleMember>(); 

		// create a copy of constraints object (constraintsClone)
		Constraints constraints = new Constraints(userConstraints);

		// get a list of available courses from the sequence
		List<Course> availableCourses = regHistoryService.getAvailable(constraints.getStudentId());

		Double credits = 0.00;			// amount of accumulated credits (specified by the user)
		Integer numberOfCourses = 0;	// course counter (6 courses limit)

		// for each course in the list of available courses do:
		for (Course availableCourse : availableCourses)
		{
			if (isPrerequsitesCompleted(availableCourse, availableCourses) &&
				(credits < constraints.getMaxCredits()) &&
				(numberOfCourses < 6))
			{
				// get a set of sections for the course
				Set<Section> courseSections = availableCourse.getSections();

				// for each section in the set of sections do:
				for (Section section : courseSections)
				{
					// verify if section time slots match constrains times
					List<TimeSlot> timeSlots = matchTimeSlots(section, constraints);

					// if matched, add course to the schedule and update constraints
					if (timeSlots != null)
					{
						credits =+ availableCourse.getCredits();
						numberOfCourses++;

						// create schedule member
						ScheduleMember scheduleMember = new ScheduleMember();
						scheduleMember.setScheduleMemberId(availableCourse.getCourseId().toString() + "Mem");
						scheduleMember.setCourseCode(availableCourse.getCourseId());
						scheduleMember.setSection(section);
						scheduleMember.setSchedule(schedule);

						// add schedule member to the set
						scheduleMembers.add(scheduleMember);

						// add set of schedule members to the schedule
						schedule.setScheduleMembers(scheduleMembers);

						updateTimeConstraints(timeSlots, constraints);

						// leave the loop and proceed with the next course
						break;
					}
				}
			}
		}

		// add schedule to the list of schedules
		schedules.add(schedule);

		// save schedule
		saveSchedule(schedule);
	
		return schedules;
	}


	// --------------------------------------------------------------------------------------------------------------------------------
	// Helper methods.
	// --------------------------------------------------------------------------------------------------------------------------------

	// -------------------------------------------------------------------------------
	/**
	 * 	Returns true if all prerequisites for the specified course were completed.
	 */
	// -------------------------------------------------------------------------------
	private Boolean isPrerequsitesCompleted(Course availableCourse, List<Course> avalableCourses)
	{
		// get prerequisites for the given course
		Set<Prerequisite> prerequisites = availableCourse.getPrerequisites();

		// verify if prerequisite is not in the list of available courses
		for (Prerequisite prerequisite : prerequisites)
		{
			String prerequisiteCode = prerequisite.getPrerequisiteId();
			for (Course course : avalableCourses)
				if (prerequisiteCode.equals(course.getCourseId()))
					return false;
		}
		
		return true;
	}

	// -------------------------------------------------------------------------------
	/**
	 * 	Returns a list of TimeSlots (lecture, tutorial, lab)
	 *	if they match time constraints. Return null otherwise.
	 */
	// -------------------------------------------------------------------------------
	private List<TimeSlot> matchTimeSlots(Section section, Constraints constraints)
	{
		List<TimeSlot> timeSlots = section.getTimeSlots();
		List<TimeConstraint> timeConstraints = constraints.getTimeConstraints();

		// for each TimeSlot in the section verify if it matches at least one time constraint
		for (TimeSlot timeSlot : timeSlots)
		{
			// match flag
			boolean timeSlotMatch = false;

			for (TimeConstraint timeConstraint : timeConstraints)
			{
				// get constraint date parameters

				DayOfWeekEnum constraintWeekDay = timeConstraint.getDayOfWeek();
				Date constraintStartTime = stringToDate(timeConstraint.getStartTime());
				Date constraintEndTime = stringToDate(timeConstraint.getEndTime());

				// get TimeSlot date parameters

				DayOfWeekEnum timeslotWeekDay = timeSlot.getDayOfWeek();
				Date timeslotStartTime = timeSlot.getStartTime();
				Date timeslotEndTime = timeSlot.getEndTime();

				// compare TimeSlot and constraint weekdays and times

				if (timeslotWeekDay.equals(constraintWeekDay) &&
					(timeslotStartTime.compareTo(constraintStartTime) >= 0) &&
					(timeslotEndTime.compareTo(constraintEndTime) <= 0))
				{
					// upon match update status flag and break the loop to verify next timeSlot;
					timeSlotMatch = true;
					break;
				}				
			}

			// bail out if no match is found for at least one TimeSlot

			if (!timeSlotMatch)
				return null;
		}		

		return timeSlots;
	}

	// -------------------------------------------------------------------------------
	/**
	 * Updates constraint time ranges according to reserved TimeSlot.
	 */
	// -------------------------------------------------------------------------------
	private void updateTimeConstraints(List<TimeSlot> timeSlots, Constraints constraints)
	{
		// get a list of time constraints
		List<TimeConstraint> timeConstraints = constraints.getTimeConstraints();

		for (TimeSlot timeSlot : timeSlots)
		{
			// create new list for updated time constraints to avoid modifying collection that is being iterated
			List<TimeConstraint> updatedTimeConstraints = new ArrayList<TimeConstraint>();

			DayOfWeekEnum slotDay = timeSlot.getDayOfWeek();
			Date slotStart = timeSlot.getStartTime();
			Date slotEnd = timeSlot.getEndTime();

			for (TimeConstraint timeConstraint : timeConstraints)
			{
				DayOfWeekEnum constraintDay = timeConstraint.getDayOfWeek();
				Date constraintStart = stringToDate(timeConstraint.getStartTime());
				Date constraintEnd = stringToDate(timeConstraint.getEndTime());

				if (slotDay.equals(constraintDay))
				{
					if (slotStart.equals(constraintStart) && slotEnd.equals(constraintEnd))
						timeConstraints.remove(timeConstraint);

					else if (slotStart.equals(constraintStart) && slotEnd.before(constraintEnd))
					{
						timeConstraint.setStartTime(dateToString(slotEnd));
						updatedTimeConstraints.add(timeConstraint);
					}

					else if (slotStart.after(constraintStart) && slotEnd.equals(constraintEnd))
					{
						timeConstraint.setEndTime(dateToString(slotStart));
						updatedTimeConstraints.add(timeConstraint);
					}

					else
					{
						timeConstraint.setEndTime(dateToString(slotStart));
						updatedTimeConstraints.add(timeConstraint);

						TimeConstraint splitConstraint = new TimeConstraint();
						splitConstraint.setDayOfWeek(constraintDay);
						splitConstraint.setStartTime(dateToString(slotEnd));
						splitConstraint.setEndTime(dateToString(constraintEnd));

						updatedTimeConstraints.add(splitConstraint);
					}
				}
				else
					updatedTimeConstraints.add(timeConstraint);
			}

			timeConstraints = updatedTimeConstraints;
		}
	}

	
	// -------------------------------------------------------------------------------
	/**
	 * Converts time String to the Date object
	 */
	// -------------------------------------------------------------------------------
	public static Date stringToDate(String time)
	{
		DateFormat timeConverter = new SimpleDateFormat("HH:mm:ss");

		Date date = null;
		try
		{
			date = timeConverter.parse(time);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
 
		return date;
	}

	// -------------------------------------------------------------------------------
	/**
	 * Converts Date to String
	 */
	// -------------------------------------------------------------------------------
	public static String dateToString(Date time)
	{
		SimpleDateFormat form = new SimpleDateFormat("HH:mm:ss");
		return form.format(time);
	}
}
