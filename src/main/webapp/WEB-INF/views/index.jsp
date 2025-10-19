<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Admission</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">	
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa; 
}

.card-form {
    border: 1px solid #dee2e6; 
    border-radius: 0.5rem;
    padding: 20px;
    background-color: white;
}

.applicant-details-box {
    border: 2px solid #007bff; 
    border-radius: 8px;
    padding: 25px;
    margin-top: 30px;
    position: relative;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.applicant-details-title {
    background: white;
    padding: 0 15px;
    position: absolute;
    top: -15px;
    left: 20px;
    font-weight: bold;
    color: #007bff; 
}

.header .text-primary {
	font-weight: 600;
}
</style>
</head>
<body>
	<div class="container my-5">
		<div class="header mb-4">
			<div class="text-primary h2 text-center">
				College Admission Form <span class="h6 text-danger px-2"> 
					<span class="text-danger">*</span>mandatory fields
				</span>
			</div>
		</div>

		<div class="card-form mx-auto" style="max-width: 900px;">
		
			<form action="./raj" method="post" onsubmit="return checkForm(event)">
				
                <div class="row justify-content-center mb-4">
					<div class="col-md-5">
						<label class="form-label fw-bold"> College Name <span
							class="text-danger">*</span>
						</label> 
						<select id="cId"  name="cname" class="form-select" onchange="getBranchListByCollege()">
							<option value="-1">-- select --</option>
							<c:forEach items="${clist}" var="c">
								<option value="${c.collegeId}">${c.collegeName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-5">
						<label class="form-label fw-bold"> Branch Name <span
							class="text-danger">*</span>
						</label> 
                        <select class="form-select" id="bId" name="bname">
							<option value="-1">-- select --</option>
						</select>
					</div>
				</div>

                <div class="applicant-details-box">
					<span class="applicant-details-title">Applicant Details</span>
					
                    <div class="row mb-3">
						<div class="col-md-4">
							<label class="form-label"> Name <span class="text-danger">*</span>
							</label> <input type="text" class="form-control" id="no" name="nname">
						</div>
						<div class="col-md-4">
							<label class="form-label"> Email <span
								class="text-danger">*</span>
							</label> <input type="text" class="form-control" id="as" name="ename">
						</div>
						<div class="col-md-4">
							<label class="form-label"> Mobile No <span
								class="text-danger">*</span>
							</label> <input type="text" class="form-control" id="us" name="mname">
						</div>
					</div>
						
                    <div class="row mb-3">
						<div class="col-md-6">
							<label class="form-label">Father's Name <span class="text-danger">*</span></label>
							<input type="text" name="fname" class="form-control" required>
						</div>
						<div class="col-md-6">
							<label class="form-label">Adhar Number <span class="text-danger">*</span></label>
							<input type="text" name="aname" class="form-control" required>
						</div>
					</div>

                    <div class="row mb-3">
						<div class="col-md-6">
							<label class="form-label">Caste <span class="text-danger">*</span></label>
							<select name="cstname" class="form-select" required>
								<option value="">-- Select --</option>
								<option value="GEN">GEN</option>
								<option value="ST">ST</option>
								<option value="SC">SC</option>
								<option value="OBC">OBC</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">Blood Type <span class="text-danger">*</span></label>
							<select name="bldname" class="form-select" required>
								<option value="">-- Select --</option>
								<option value="A+">A+</option>
								<option value="A-">A-</option>
								<option value="B+">B+</option>
								<option value="B-">B-</option>
								<option value="AB+">AB+</option>
								<option value="AB-">AB-</option>
								<option value="O+">O+</option>
								<option value="O-">O-</option>
							</select>
						</div>
					</div>

                    <div class="row mb-4 align-items-center">
						<div class="col-md-6">
							<label class="form-label"> Date Of Birth <span
								class="text-danger">*</span>
							</label> 
                            <input type="date" class="form-control" id="uus" name="dname">
						</div>
						<div class="col-md-6">
							<label class="form-label"> Gender <span
								class="text-danger">*</span>
							</label>
							<div class="mt-1">
								<input type="radio" name="gender" value="male" checked="checked" class="form-check-input"> <span class="me-3">Male</span>
								<input type="radio" name="gender" value="female" class="form-check-input"> <span>Female</span>
							</div>
						</div>
					</div>
                    
                    <div class="mt-3 text-center">
						<button type="submit" class="btn btn-info px-4 me-2">Submit</button>
						<button type="reset" class="btn btn-warning px-4">Reset</button>
					</div>

			</form>
		</div> </div> <script type="text/javascript">
	
		function getBranchListByCollege() {
			
			let cId = document.getElementById("cId").value;
			
			if (cId == '-1') {
                document.getElementById("bId").innerHTML = '<option value="-1">-- select --</option>';
                return;
            }
			
			//ajax takes JSON as parameter & need support of jQuery to run
			$.ajax({
				url:"./getBranchByCollege",
				method:"GET",
				data:"collegeId="+cId,
				success:function(res){
					
					let bid = document.getElementById("bId");
					bid.innerHTML="";
					bid.innerHTML=res;
				}
			});
			
		}
		
		function checkForm(raj){
			
			let collegeInp = document.getElementById("cId").value;
			let branchInp = document.getElementById("bId").value;
			let nameInp = document.getElementById("no").value;
			let emailInp = document.getElementById("as").value;
			let mobileNoInp = document.getElementById("us").value;
			let dateOfBirthInp = document.getElementById("uus").value;
            // Get values for new fields
            let fatherNameInp = document.querySelector('input[name="fname"]').value;
            let adharNumberInp = document.querySelector('input[name="aname"]').value;
            let casteInp = document.querySelector('select[name="cstname"]').value; 
            let bloodTypeInp = document.querySelector('select[name="bldname"]').value;
			
			// Validation Logic for all fields
			if(collegeInp == "-1"){
				toastr.error('Please Select College','Error');
				raj.preventDefault();
				return false;
			}
			
			if(branchInp == "-1" || branchInp.includes("select")){
				toastr.error('Please Select Branch','Error');
				raj.preventDefault();
				return false;
			}
			
			if(nameInp == ""){
				toastr.error('Please enter Name','Error');
				raj.preventDefault();
				return false;
			}
			if(emailInp == ""){
				toastr.error('Please enter Email','Error');
				raj.preventDefault();
				return false;
			}
			if(mobileNoInp == ""){
				toastr.error('Please enter Mobile No','Error');
				raj.preventDefault();
				return false;
			}
            
            if(fatherNameInp == ""){
				toastr.error('Please enter Fathers Name','Error');
				raj.preventDefault();
				return false;
			}
            if(adharNumberInp == ""){
				toastr.error('Please enter Adhar Number','Error');
				raj.preventDefault();
				return false;
			}
            if(casteInp == ""){
				toastr.error('Please Select Caste','Error');
				raj.preventDefault();
				return false;
			}
            if(bloodTypeInp == ""){
				toastr.error('Please Select Blood Type','Error');
				raj.preventDefault();
				return false;
			}
            
			if(dateOfBirthInp == ""){
				toastr.error('Please enter DOB','Error');
				raj.preventDefault();
				return false;
			}
            
            // If all checks pass
            return true;
		}
        
        // NEW: Code to check for the success message and display the toast notification
        $(document).ready(function() {
            // Check if the 'registrationSuccess' flash attribute exists
            <c:if test="${not empty registrationSuccess && registrationSuccess}">
                let appName = "${appName}";
                
                // Display the success message using toastr
                toastr.options = {
                    "closeButton": true,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000", // Will stay for 5 seconds
                    "extendedTimeOut": "1000",
                };
                toastr.success('Thank you, ' + appName + ', your application has been submitted!', 'Registration Successful');
            </c:if>
        });
	</script>
</body>
</html>