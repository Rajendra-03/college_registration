<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome | Admission Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">	
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <style>
        body {
            /* Changed font to a clean sans-serif stack */
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #e9ecef; /* Slightly deeper background grey */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .main-card {
            max-width: 550px; /* Slightly narrower for focus */
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15); /* Softer shadow */
            background-color: white;
            border: 1px solid #ced4da;
        }
        .header-title {
            font-weight: 700;
            color: #007bff; /* Primary blue */
            letter-spacing: 1px;
            margin-bottom: 3rem !important;
        }
        .action-group {
            padding: 25px;
            border-radius: 8px;
            margin-bottom: 25px;
        }
        .student-group {
            background-color: #d4edda; /* Light green background for visibility */
            border: 1px solid #c3e6cb;
        }
        .admin-group {
            background-color: #f8f9fa; /* Very light background for distinction */
            border: 1px solid #e2e6ea;
        }
        .login-form-container {
            border-radius: 8px;
            padding: 20px;
            background-color: #e9ecef; /* Matches body background for a 'cutout' effect */
        }
    </style>
</head>
<body>
    <div class="main-card text-center">
        <h1 class="header-title mb-5">
            ADMISSION MANAGEMENT PORTAL
        </h1>
        
        <div class="action-group student-group mb-5">
            <h4 class="mb-4 text-dark fw-normal">Ready to Enroll?</h4>
            <a href="/menu/index" class="btn btn-success btn-lg px-5">
                <i class="fas fa-file-alt me-2"></i> NEW STUDENT REGISTRATION
            </a>
        </div>
        
        <hr class="mb-4">

        <div id="admin-section" class="action-group admin-group">
            <h4 class="mb-3 text-secondary fw-normal">Portal Management & Review</h4>
            <button class="btn btn-primary btn-lg px-5" onclick="showLoginForm()">
                <i class="fas fa-chart-line me-2"></i> ADMIN LOGIN
            </button>
        </div>

        <div id="login-form-container" style="display: none;" class="mt-4 login-form-container">
            <form action="/menu/adminLogin" method="post" onsubmit="return validateLogin(event)">
                <p class="mb-3 text-dark fw-bold">Enter Credentials to Access List</p>
                <div class="mb-3">
                    <input type="text" class="form-control" name="username" id="admin-user" placeholder="Username" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="password" id="admin-pass" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Log In</button>
            </form>
        </div>
        
        <c:if test="${not empty loginError}">
            <script>
                $(document).ready(function() {
                    showLoginForm(); // Show the form again on error
                    toastr.error("${loginError}", 'Login Failed');
                });
            </script>
        </c:if>
        
    </div>

    <script>
        function showLoginForm() {
            $('#admin-section').slideUp(200); // Smooth animation
            $('#login-form-container').slideDown(400); // Smooth animation
        }

        // Basic client-side validation for empty fields
        function validateLogin(event) {
            if ($('#admin-user').val().trim() === '' || $('#admin-pass').val().trim() === '') {
                toastr.error('Username and Password are required.', 'Validation Error');
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>