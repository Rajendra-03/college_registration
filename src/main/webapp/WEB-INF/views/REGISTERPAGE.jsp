<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Applicants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <style>
        .table th, .table td {
            vertical-align: middle;
            font-size: 0.8rem; /* Smaller font for more columns */
        }
        .container-list {
            max-width: 98%; /* Wider container */
        }
    </style>
</head>
<body>

<div class="container container-list mt-5">
    <h3 class="text-center text-primary mb-4">Registered Applicants</h3>

    <c:if test="${not empty updateSuccess && updateSuccess}">
        <div class="alert alert-success text-center" role="alert">
            Registration for <strong>${appName}</strong> updated successfully!
        </div>
        
        <div class="d-flex justify-content-center mb-4">
            <a href="/menu/index" class="btn btn-primary btn-lg me-3">
                Go to Registration Page
            </a>
            <a href="/menu/showRegistrationList" class="btn btn-secondary btn-lg">
                View Full List Again
            </a>
        </div>
    </c:if>

    <c:if test="${not empty noChanges && noChanges}">
        <div class="alert alert-warning text-center" role="alert">
            No changes were detected, so the registration was not updated.
        </div>
    </c:if>
    
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Sl. No</th>
                    <th>College</th>
                    <th>Branch</th>
                    <th>Name</th>
                    <th>Father Name</th>    <th>Adhar No</th>       <th>Caste</th>          <th>Blood Type</th>     <th>Email</th>
                    <th>Mobile</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reglist}" var="reg" varStatus="counter">
                    <tr>
                        <td>${counter.index + 1}</td>
                        <td>${reg.college.collegeName}</td>
                        <td>${reg.branch.branchName}</td>
                        <td>${reg.appName}</td>
                        <td>${reg.fatherName}</td>      <td>${reg.adharNumber}</td>     <td>${reg.caste}</td>           <td>${reg.bloodType}</td>       <td>${reg.email}</td>
                        <td>${reg.mobile}</td>
                        <td>${reg.dob}</td>
                        <td>${reg.gender}</td>
                        <td>
                            <a href="editRegistration?id=${reg.regId}" class="btn btn-sm btn-info">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>