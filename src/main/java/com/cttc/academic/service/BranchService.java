package com.cttc.academic.service;

import java.util.List;

import com.cttc.academic.model.BranchMaster;

public interface BranchService {

	List<BranchMaster> findAllBranchByCollegeId(Integer clgId);

	BranchMaster findBranchById(Integer bId);

}
