package com.cttc.academic.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table

public class CollegeMaster {
	@Id
    @Column(name="college_id")
	Integer collegeId;
	
	@Column(name="college_name")
	String collegeName;

	@Override
	public String toString() {
		return "CollegeMaster [collegeId=" + collegeId + ", collegeName=" + collegeName + "]";
	}

	public Integer getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Integer collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	
}
