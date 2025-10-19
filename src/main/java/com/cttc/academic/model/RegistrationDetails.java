package com.cttc.academic.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="registration_details")
public class RegistrationDetails {
	@Id
	@Column(name="registration_id")
	Integer regId;
	
	@Column(name="application_name")
	String appName;
	
	@Column(name="email_id")
	String email;
	
	@Column(name="mobile_no")
	String mobile;
	
	@Column(name="gender")
	String gender;
	
	@Column(name="dob")
	String dob;

    // --- NEW FIELDS ADDED ---
    @Column(name="father_name")
    String fatherName;

    @Column(name="adhar_no")
    String adharNumber;

    @Column(name="caste")
    String caste;

    @Column(name="blood_type")
    String bloodType;
    // --- END NEW FIELDS ---
	
	@ManyToOne
	@JoinColumn(name="college_id")
	CollegeMaster college;
	
	@ManyToOne
	@JoinColumn(name="branch_id")
	BranchMaster branch;
	
	@Override
	public String toString() {
		return "RegistrationDetails [regId=" + regId + ", appName=" + appName + ", email=" + email + ", mobile="
				+ mobile + ", gender=" + gender + ", dob=" + dob + ", fatherName=" + fatherName + 
                ", adharNumber=" + adharNumber + ", caste=" + caste + ", bloodType=" + bloodType + 
                ", college=" + college + ", branch=" + branch + "]";
	}

	public Integer getRegId() {
		return regId;
	}

	public void setRegId(Integer regId) {
		this.regId = regId;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
    
    // --- NEW GETTERS AND SETTERS ---
    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getAdharNumber() {
        return adharNumber;
    }

    public void setAdharNumber(String adharNumber) {
        this.adharNumber = adharNumber;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }
    // --- END NEW GETTERS AND SETTERS ---

	public CollegeMaster getCollege() {
		return college;
	}

	public void setCollege(CollegeMaster college) {
		this.college = college;
	}

	public BranchMaster getBranch() {
		return branch;
	}

	public void setBranch(BranchMaster branch) {
		this.branch = branch;
	}
	
}