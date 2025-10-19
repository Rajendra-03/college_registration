package com.cttc.academic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cttc.academic.model.BranchMaster;
import com.cttc.academic.repository.BranchRepository;
import com.cttc.academic.service.BranchService;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	BranchRepository branchRepository;

	@Override
	public List<BranchMaster> findAllBranchByCollegeId(Integer clgId) {
		// TODO Auto-generated method stub
		return branchRepository.findAllBranchByCollegeId(clgId);
	}

	@Override
	public BranchMaster findBranchById(Integer bId) {
		// TODO Auto-generated method stub
		return branchRepository.findById(bId).get();
	}

}
