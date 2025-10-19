package com.cttc.academic.service;

import java.util.List;

import com.cttc.academic.model.RegistrationDetails;

public interface RegistrationService {

	void saveStudent(RegistrationDetails newReg);

	List<RegistrationDetails> findAllRegistrationDetails();

	    RegistrationDetails findById(Integer regId); 
	}