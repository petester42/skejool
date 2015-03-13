package com.soen341.service;

import java.util.List;
import java.util.Map;

import com.soen341.model.SequenceMember;

public interface SequenceService
{
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a collection of courses for the given programId.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<SequenceMember> loadByProgramId(String programId);

	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a collection of courses for the given sequenceId.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<SequenceMember> loadBySequenceId(String sequenceId);
	
	// --------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Returns a sorted collection of courses for the given sequenceId.
	 */
	// --------------------------------------------------------------------------------------------------------------------------------
	public List<Map<String,Object>> sortSequence(String sequenceId);
}