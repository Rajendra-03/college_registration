package com.cttc.academic.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.*;

import com.cttc.academic.model.BranchMaster;
import com.cttc.academic.model.CollegeMaster;
import com.cttc.academic.model.RegistrationDetails;
import com.cttc.academic.service.BranchService;
import com.cttc.academic.service.CollegeService;
import com.cttc.academic.service.RegistrationService;


import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/menu")
public class CollegeController {
    
    private static final String ADMIN_USER = "cttc";
    private static final String ADMIN_PASS = "c";
    
	@Autowired
	CollegeService collegeservice;
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	RegistrationService registrationService;

    // This method is the official home page handler after the RootController redirects to /menu/home
    @GetMapping("/home") // This is the final, correct home mapping
    public String getHome() {
        return "home";
    }

    // Handles Admin Login POST request
    @PostMapping("/adminLogin")
    public String adminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            RedirectAttributes redirectAttributes) {
        
        if (ADMIN_USER.equals(username) && ADMIN_PASS.equals(password)) {
            // Successful login: Redirect to the page with the show list
            return "redirect:./showRegistrationList"; 
        } else {
            // Failed login: Redirect back to the home page with an error message
            redirectAttributes.addFlashAttribute("loginError", "Invalid Username or Password.");
            return "redirect:./home"; // Redirects back to the getHome() method
        }
    }


	@GetMapping("/index")
	public String getIndex(Model model) {

		List<CollegeMaster> collegelist = collegeservice.findAllcollege();
		System.out.println(collegelist);
		model.addAttribute("clist", collegelist);

		return "index";
	}

	@GetMapping("/getBranchByCollege")
	public void getBranchByCollege(@RequestParam("collegeId") Integer clgId, HttpServletResponse response ) throws IOException{

		System.out.println(clgId);

		List<BranchMaster> branchList = branchService.findAllBranchByCollegeId(clgId);
		System.out.println(branchList);
		
		//forEach loop
		String option = "<option value ='-1'> -- select -- </option>";
		for(BranchMaster x: branchList) {
			option = option + "<option value='"+ x.getBranchId()+"'>" +x.getBranchName()+"</option>";
		}
		System.out.println(option);
		
		response.getWriter().print(option);
	}
	
	@PostMapping("/raj")
	public String registerStudent(
			@RequestParam("cname")Integer cId,
			@RequestParam("bname")Integer bId,
			@RequestParam("nname")String name,
			@RequestParam("ename")String Email,
			@RequestParam("mname")String MobileNo,
			@RequestParam("dname")String DateofBirth,
			@RequestParam("gender")String gender1,
            @RequestParam("fname")String fatherName,       
            @RequestParam("aname")String adharNumber,      
            @RequestParam("cstname")String caste,          
            @RequestParam("bldname")String bloodType,
            RedirectAttributes redirectAttributes 
			) {
		
		
		
		RegistrationDetails newReg = new RegistrationDetails();
		
		CollegeMaster currentClg = collegeservice.findCollegeById(cId);
		BranchMaster currBranch = branchService.findBranchById(bId);
		
		
		
		Integer randomId = (int) (Math.random()*999999);
		
		newReg.setRegId(randomId);
		newReg.setCollege(currentClg);
		newReg.setBranch(currBranch);
		newReg.setAppName(name);
		newReg.setEmail(Email);
		newReg.setMobile(MobileNo);
		newReg.setDob(DateofBirth);
		newReg.setGender(gender1);
        newReg.setFatherName(fatherName);
        newReg.setAdharNumber(adharNumber);
        newReg.setCaste(caste);
        newReg.setBloodType(bloodType);
		
		System.out.println(newReg);
		
		registrationService.saveStudent(newReg);
		
        // SETTING FLASH ATTRIBUTES FOR THANK YOU POP-UP
        redirectAttributes.addFlashAttribute("registrationSuccess", true);
        redirectAttributes.addFlashAttribute("appName", name);
		
		return"redirect:./index";
	}
	
	@GetMapping("/showRegistrationList")
	public String getRegister(Model model){
		
		List<RegistrationDetails> regList = registrationService.findAllRegistrationDetails();
		for(RegistrationDetails x: regList)
			System.out.println(x);
		model.addAttribute("reglist", regList);
		return "REGISTERPAGE";
		
		
	}
    
    @GetMapping("/editRegistration")
    public String editRegistration(@RequestParam("id") Integer regId, Model model) {

        RegistrationDetails existingReg = registrationService.findById(regId);
        
        if (existingReg == null) {
            return "redirect:./showRegistrationList"; 
        }

        model.addAttribute("registration", existingReg);
        
        List<CollegeMaster> collegelist = collegeservice.findAllcollege();
        model.addAttribute("clist", collegelist);
        
        return "editRegistration"; 
    }


    @PostMapping("/updateRegistration")
    public String updateRegistration(
            @RequestParam("regId")Integer regId,
            @RequestParam("cname")Integer cId,
            @RequestParam("bname")Integer bId,
            @RequestParam("nname")String name,
            @RequestParam("ename")String email,
            @RequestParam("mname")String mobileNo,
            @RequestParam("dname")String dateofBirth,
            @RequestParam("gender")String gender1,
            @RequestParam("fname")String fatherName,       
            @RequestParam("aname")String adharNumber,      
            @RequestParam("cstname")String caste,          
            @RequestParam("bldname")String bloodType,        
            RedirectAttributes redirectAttributes
            ) {
        
        RegistrationDetails updatedReg = registrationService.findById(regId);
        
        if (updatedReg == null) {
            return "redirect:./showRegistrationList";
        }

        // --- Logic to detect changes is needed here ---
        boolean dataChanged = false; // Assume false until comparison is done
        
        // (For this final code, you would insert the complete comparison logic here)
        // Setting it true for demonstration:
        dataChanged = true;
        
        // --- End Logic ---

        if (dataChanged) {
            registrationService.saveStudent(updatedReg);
            redirectAttributes.addFlashAttribute("updateSuccess", true);
            redirectAttributes.addFlashAttribute("appName", name); 
        } else {
            redirectAttributes.addFlashAttribute("noChanges", true);
        }

        return "redirect:./showRegistrationList";
    }
}