
package com.soen341.model.enums;

public enum DayOfWeekEnum
{
	// Append new enum constants at the end of the list.

	MON("Monday"),
	TUE("Tuesday"),
	WED("Wednesday"),
	THU("Thursday"),
	FRI("Friday");

	@SuppressWarnings("unused")
	private String name;
	
	// --------------------------------------------------------------------------------------------------------------------------------
	private DayOfWeekEnum(String name)
	{
		this.name = name;
	}

}
