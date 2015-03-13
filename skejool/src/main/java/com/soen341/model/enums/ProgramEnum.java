
package com.soen341.model.enums;

public enum ProgramEnum
{
	// Append new enum constants at the end of the list.

	ELEC("Electrical Engineering"),
	COEN("Computer Engineering");
	

	@SuppressWarnings("unused")
	private String name;
	
	// --------------------------------------------------------------------------------------------------------------------------------
	private ProgramEnum(String name)
	{
		this.name = name;
	}

}
