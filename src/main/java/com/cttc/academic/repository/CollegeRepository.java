package com.cttc.academic.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cttc.academic.model.CollegeMaster;

public interface CollegeRepository extends JpaRepository<CollegeMaster, Integer>{

	

}
