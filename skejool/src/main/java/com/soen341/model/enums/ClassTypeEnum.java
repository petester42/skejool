
package com.soen341.model.enums;

public enum ClassTypeEnum
{
	// Append new enum constants at the end of the list.

	LEC("Lecture"),
	TUT("Tutorial"),
	LAB("Laboratory");

	@SuppressWarnings("unused")
	private String name;
	
	// --------------------------------------------------------------------------------------------------------------------------------
	private ClassTypeEnum(String name)
	{
		this.name = name;
	}

}
