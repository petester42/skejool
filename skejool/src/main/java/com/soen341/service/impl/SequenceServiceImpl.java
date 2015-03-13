package com.soen341.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sound.midi.Sequence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soen341.dao.ProgramDao;
import com.soen341.dao.SequenceDao;
import com.soen341.model.Program;
import com.soen341.model.SequenceMember;
import com.soen341.service.SequenceService;

//--------------------------------------------------------------------------------------------------------------------------------
/**
 * Provides implementation for services around the {@link Sequence} entity.
 */
//--------------------------------------------------------------------------------------------------------------------------------
@Service("sequenceService")
public class SequenceServiceImpl implements SequenceService
{
	@Autowired
	private SequenceDao sequenceDao;
    
	@Autowired
	private ProgramDao programDao;
    
	//--------------------------------------------------------------------------------------------------------------------------------
	/**
	 * Sets the underlying SequenceDao implementation to be used by the services.
	 */
	//--------------------------------------------------------------------------------------------------------------------------------
	public void setSequenceDao(SequenceDao sequenceDao)
	{
		this.sequenceDao = sequenceDao;
	}
    
	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<SequenceMember> loadByProgramId(String programId)
	{
		Program program = programDao.loadProgram(programId);
		
		return loadBySequenceId(program.getSequenceId());
	}


	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<SequenceMember> loadBySequenceId(String sequenceId)
	{
		List<SequenceMember> sequence = sequenceDao.loadSequenceMembers(sequenceId);
		
		return sequence;
	}

	// -------------------------------------------------------------------------------
	@Transactional(readOnly = true)
	public List<Map<String,Object>> sortSequence(String sequenceId)
	{
        
		List<SequenceMember> sequence = sequenceDao.loadSequenceMembers(sequenceId);
		
		//sorting
		
        List<Map<String,Object>> sortedSequence = new ArrayList<Map<String,Object>>();
		int numberOfYears = 0;
        
		for (int y=0; y < sequence.size(); ++y){
            
			if(sequence.get(y).getCourseYear() > numberOfYears){
				numberOfYears = sequence.get(y).getCourseYear();
			}
            
		}
        
		for (int i = 1; i < numberOfYears+1 ; ++i){
            
			//1=summer 2=fall 3=fall/winter 4=winter so will never be 5
			
			for (int semesterID = 1; semesterID < 5; ++semesterID){
                
				if (semesterID == 3){
					continue;
                }
                
				List<SequenceMember> sequenceMembers = new ArrayList<SequenceMember>();
                
				for (int id = 0; id < sequence.size(); ++id){
                    
					if (semesterID != 1){
                        
						if (sequence.get(id).getCourseYear() == i && (sequence.get(id).getSemester() == semesterID || sequence.get(id).getSemester() == 3)){
                            sequenceMembers.add(sequence.get(id));	
                        }
                    }
                    
                    else {
                        
                        if (sequence.get(id).getCourseYear() == i && sequence.get(id).getSemester() == semesterID){
                            sequenceMembers.add(sequence.get(id));
                        }
                    }
                }
                
                Map<String,Object> map = new HashMap<String,Object>();
				
                String semesterSTR;
                
                switch(semesterID){
                    case 1:
                        semesterSTR = "Summer";
                        break;
                    case 2:
                        semesterSTR = "Fall";
                        break;
                    case 3:
                        semesterSTR = "Fall/Winter";
                        break;
                    case 4:
                        semesterSTR = "Winter";
                        break;
                    default:
                        semesterSTR = "";
                        break;			
                }
                
                if (sequenceMembers.size() == 0){
                    //there is no summer semester do not add it
                }
                
                else {
                    
                    map.put("courses", sequenceMembers);
                    map.put("semester", semesterSTR + " Year " + i );
                    sortedSequence.add(map);	
                }
            }
        }
        
        return sortedSequence;
	}
}
