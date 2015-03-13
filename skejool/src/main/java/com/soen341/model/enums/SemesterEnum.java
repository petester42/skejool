
package com.soen341.model.enums;

public enum SemesterEnum
{
	// Append new enum constants at the end of the list.

	F("Fall"),
	W("Winter"),
	S("Summer"),
	FW("FallWinter");

	@SuppressWarnings("unused")
	private String name;
	
	// --------------------------------------------------------------------------------------------------------------------------------
	private SemesterEnum(String name)
	{
		this.name = name;
	}

}
