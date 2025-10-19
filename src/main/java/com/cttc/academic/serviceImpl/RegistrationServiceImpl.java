package com.cttc.academic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cttc.academic.model.RegistrationDetails;
import com.cttc.academic.repository.RegistrationRepository;
import com.cttc.academic.service.RegistrationService;

@Service
public class RegistrationServiceImpl implements RegistrationService{

	@Autowired
	RegistrationRepository registrationRepository;
	
	@Override
	public void saveStudent(RegistrationDetails newReg) {
		registrationRepository.save(newReg);
	}

	@Override
	public List<RegistrationDetails> findAllRegistrationDetails() {
		return registrationRepository.findAll();
	}

    // New: Implementation to fetch a single record by ID
    @Override
	public RegistrationDetails findById(Integer regId) {
		return registrationRepository.findById(regId).orElse(null); 
	}
}