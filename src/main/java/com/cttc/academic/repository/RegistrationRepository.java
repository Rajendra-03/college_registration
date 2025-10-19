package com.cttc.academic.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cttc.academic.model.RegistrationDetails;

public interface RegistrationRepository extends JpaRepository<RegistrationDetails, Integer>{

}
