package com.cttc.academic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cttc.academic.model.CollegeMaster;
import com.cttc.academic.repository.CollegeRepository;
import com.cttc.academic.service.CollegeService;

@Service
public class CollegeServiceImpl implements CollegeService {
	@Autowired
	CollegeRepository collegeRepository;

	@Override
	public List<CollegeMaster> findAllcollege() {
		// TODO Auto-generated method stub
		return collegeRepository.findAll();
	}

	@Override
	public CollegeMaster findCollegeById(Integer cId) {
		// TODO Auto-generated method stub
		return collegeRepository.findById(cId).get();
	}

	

	
	
	

}
