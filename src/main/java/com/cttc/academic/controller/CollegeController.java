package com.cttc.academic.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private CollegeService collegeservice;

    @Autowired
    private BranchService branchService;

    @Autowired
    private RegistrationService registrationService;

    // ✅ Home page after login
    @GetMapping("/home")
    public String getHome() {
        return "home";
    }

    // ✅ Admin login handler
    @PostMapping("/adminLogin")
    public String adminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            RedirectAttributes redirectAttributes) {

        if (ADMIN_USER.equals(username) && ADMIN_PASS.equals(password)) {
            return "redirect:./showRegistrationList";
        } else {
            redirectAttributes.addFlashAttribute("loginError", "Invalid Username or Password.");
            return "redirect:./home";
        }
    }

    // ✅ Load College List for Registration form
    @GetMapping("/index")
    public String getIndex(Model model) {
        List<CollegeMaster> collegelist = collegeservice.findAllcollege();
        model.addAttribute("clist", collegelist);
        return "index";
    }

    // ✅ Get Branches by College (AJAX)
    @GetMapping("/getBranchByCollege")
    public void getBranchByCollege(@RequestParam("collegeId") Integer clgId, HttpServletResponse response)
            throws IOException {

        List<BranchMaster> branchList = branchService.findAllBranchByCollegeId(clgId);
        StringBuilder options = new StringBuilder("<option value='-1'> -- select -- </option>");

        for (BranchMaster branch : branchList) {
            options.append("<option value='").append(branch.getBranchId()).append("'>")
                   .append(branch.getBranchName()).append("</option>");
        }

        response.getWriter().print(options.toString());
    }

    // ✅ Register new student
    @PostMapping("/raj")
    public String registerStudent(
            @RequestParam("cname") Integer cId,
            @RequestParam("bname") Integer bId,
            @RequestParam("nname") String name,
            @RequestParam("ename") String email,
            @RequestParam("mname") String mobileNo,
            @RequestParam("dname") String dateOfBirth,
            @RequestParam("gender") String gender,
            @RequestParam("fname") String fatherName,
            @RequestParam("aname") String adharNumber,
            @RequestParam("cstname") String caste,
            @RequestParam("bldname") String bloodType,
            RedirectAttributes redirectAttributes) {

        RegistrationDetails newReg = new RegistrationDetails();
        CollegeMaster currentClg = collegeservice.findCollegeById(cId);
        BranchMaster currBranch = branchService.findBranchById(bId);

        Integer randomId = (int) (Math.random() * 999999);

        newReg.setRegId(randomId);
        newReg.setCollege(currentClg);
        newReg.setBranch(currBranch);
        newReg.setAppName(name);
        newReg.setEmail(email);
        newReg.setMobile(mobileNo);
        newReg.setDob(dateOfBirth);
        newReg.setGender(gender);
        newReg.setFatherName(fatherName);
        newReg.setAdharNumber(adharNumber);
        newReg.setCaste(caste);
        newReg.setBloodType(bloodType);

        registrationService.saveStudent(newReg);

        redirectAttributes.addFlashAttribute("registrationSuccess", true);
        redirectAttributes.addFlashAttribute("appName", name);

        return "redirect:./index";
    }

    // ✅ Show Registration List
    @GetMapping("/showRegistrationList")
    public String getRegister(Model model) {
        List<RegistrationDetails> regList = registrationService.findAllRegistrationDetails();
        model.addAttribute("reglist", regList);
        return "REGISTERPAGE";
    }

    // ✅ Edit Registration Form
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

    // ✅ Update Registration Details (Fixed)
    @PostMapping("/updateRegistration")
    public String updateRegistration(
            @RequestParam("regId") Integer regId,
            @RequestParam("cname") Integer cId,
            @RequestParam("bname") Integer bId,
            @RequestParam("nname") String name,
            @RequestParam("ename") String email,
            @RequestParam("mname") String mobileNo,
            @RequestParam("dname") String dateOfBirth,
            @RequestParam("gender") String gender,
            @RequestParam("fname") String fatherName,
            @RequestParam("aname") String adharNumber,
            @RequestParam("cstname") String caste,
            @RequestParam("bldname") String bloodType,
            RedirectAttributes redirectAttributes) {

        RegistrationDetails updatedReg = registrationService.findById(regId);

        if (updatedReg == null) {
            return "redirect:./showRegistrationList";
        }

        // Fetch associated college and branch
        CollegeMaster currentClg = collegeservice.findCollegeById(cId);
        BranchMaster currBranch = branchService.findBranchById(bId);

        // ✅ Update all fields
        updatedReg.setCollege(currentClg);
        updatedReg.setBranch(currBranch);
        updatedReg.setAppName(name);
        updatedReg.setEmail(email);
        updatedReg.setMobile(mobileNo);
        updatedReg.setDob(dateOfBirth);
        updatedReg.setGender(gender);
        updatedReg.setFatherName(fatherName);
        updatedReg.setAdharNumber(adharNumber);
        updatedReg.setCaste(caste);
        updatedReg.setBloodType(bloodType);

        // ✅ Save updated record
        registrationService.saveStudent(updatedReg);

        // ✅ Flash message for success
        redirectAttributes.addFlashAttribute("updateSuccess", true);
        redirectAttributes.addFlashAttribute("appName", name);

        return "redirect:./showRegistrationList";
    }
}
