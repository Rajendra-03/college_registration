package com.cttc.academic.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table
@Data
public class BranchMaster {
	@Id
	@Column(name="branch_id")
	Integer branchId;
	
	@Column(name="branch_name")
	String branchName;
	
	@Column(name="fees")
	String fees;
	
	@ManyToOne
	@JoinColumn(name="college_id")
	CollegeMaster collegeMaster;
	
}
