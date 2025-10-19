<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Applicant Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container my-5">
    <h3 class="text-center text-primary mb-4">Edit College Admission Form</h3>

    <form action="/menu/updateRegistration" method="POST" class="p-4 border rounded shadow-sm">
        
        <input type="hidden" name="regId" value="${registration.regId}">
        
        <div class="row mb-4">
            <div class="col-md-6">
                <label class="form-label">College Name *</label>
                <select name="cname" class="form-select" required onchange="getBranch(this.value)">
                    <option value="-1"> -- select -- </option>
                    <c:forEach items="${clist}" var="c">
                        <option value="${c.collegeId}" 
                                <c:if test="${c.collegeId == registration.college.collegeId}">selected</c:if>>
                            ${c.collegeName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Branch Name *</label>
                <select name="bname" id="branchDropdown" class="form-select" required>
                    <option value="${registration.branch.branchId}" selected>
                        ${registration.branch.branchName}
                    </option>
                </select>
            </div>
        </div>

        <h4 class="mt-4 mb-3 border-bottom pb-2">Applicant Details</h4>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Name *</label>
                <input type="text" name="nname" class="form-control" value="${registration.appName}" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Email *</label>
                <input type="email" name="ename" class="form-control" value="${registration.email}" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Mobile No *</label>
                <input type="text" name="mname" class="form-control" value="${registration.mobile}" required>
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Father's Name *</label>
                <input type="text" name="fname" class="form-control" value="${registration.fatherName}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Adhar Number *</label>
                <input type="text" name="aname" class="form-control" value="${registration.adharNumber}" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Caste *</label>
                <input type="text" name="cstname" class="form-control" value="${registration.caste}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Blood Type *</label>
                <select name="bldname" class="form-select" required>
                    <option value="">-- Select --</option>
                    <option value="A+" <c:if test="${registration.bloodType == 'A+'}">selected</c:if>>A+</option>
                    <option value="A-" <c:if test="${registration.bloodType == 'A-'}">selected</c:if>>A-</option>
                    <option value="B+" <c:if test="${registration.bloodType == 'B+'}">selected</c:if>>B+</option>
                    <option value="B-" <c:if test="${registration.bloodType == 'B-'}">selected</c:if>>B-</option>
                    <option value="AB+" <c:if test="${registration.bloodType == 'AB+'}">selected</c:if>>AB+</option>
                    <option value="AB-" <c:if test="${registration.bloodType == 'AB-'}">selected</c:if>>AB-</option>
                    <option value="O+" <c:if test="${registration.bloodType == 'O+'}">selected</c:if>>O+</option>
                    <option value="O-" <c:if test="${registration.bloodType == 'O-'}">selected</c:if>>O-</option>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Date Of Birth *</label>
                <input type="date" name="dname" class="form-control" value="${registration.dob}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label d-block">Gender *</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="male" 
                        <c:if test="${registration.gender == 'male'}">checked</c:if> required>
                    <label class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="female" 
                        <c:if test="${registration.gender == 'female'}">checked</c:if> required>
                    <label class="form-check-label">Female</label>
                </div>
            </div>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-4">
            <button type="submit" class="btn btn-success btn-lg">Update Registration</button>
            <a href="/menu/showRegistrationList" class="btn btn-secondary btn-lg">Cancel</a>
        </div>
    </form>
</div>

<script>
    function getBranch(collegeId) {
        const branchDropdown = document.getElementById('branchDropdown');
        if (collegeId == '-1') {
            branchDropdown.innerHTML = '<option value="-1"> -- select -- </option>';
            return;
        }

        fetch('/menu/getBranchByCollege?collegeId=' + collegeId)
            .then(response => response.text())
            .then(data => {
                branchDropdown.innerHTML = data;
                
                // Try to re-select the original branch after updating the list
                const currentBranchId = "${registration.branch.branchId}";
                const options = branchDropdown.options;
                for (let i = 0; i < options.length; i++) {
                    if (options[i].value === currentBranchId) {
                        options[i].selected = true;
                        break;
                    }
                }
            })
            .catch(error => console.error('Error fetching branches:', error));
    }
    
    // Call getBranch when the page loads
    document.addEventListener('DOMContentLoaded', function() {
        const selectedCollege = document.querySelector('select[name="cname"] option:checked');
        if (selectedCollege) {
            getBranch(selectedCollege.value);
        }
    });
</script>

</body>
</html>