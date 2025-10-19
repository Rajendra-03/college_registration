package com.cttc.academic.service;

import java.util.List;

import com.cttc.academic.model.CollegeMaster;



public interface CollegeService {

	static List<CollegeMaster> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	List<CollegeMaster> findAllcollege();

	CollegeMaster findCollegeById(Integer cId);

}
