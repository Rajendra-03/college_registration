package com.cttc.academic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cttc.academic.model.BranchMaster;

@Repository
public interface BranchRepository extends JpaRepository<BranchMaster ,Integer>{
	
	//HQL: Hibernate Query Language
	@Query("FROM BranchMaster where collegeMaster.collegeId=?1")
	List<BranchMaster> findAllBranchByCollegeId(Integer clgId);
}
