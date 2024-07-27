<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>LEAVE MANAGEMENT SYSTEM</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #FFFFFF; 
            font-family: Arial, sans-serif;
            color: #5B2C6F;
            margin: 0;
            padding: 0;
            background: url('https://i.pinimg.com/originals/dc/0b/e1/dc0be1e02f1aa1f113b217facb3a9109.gif') no-repeat fixed; /* Background image */
            background-size: cover;
            background-position: center;
            height: 100vh; /* Ensure body covers viewport height */
        }
        .navbar {
            background-color:#5E4B66; 
            height: 50px; /* Height of the top bar */
            width: 100%; /* Full width */
        }
        .navbar-brand {
            color: #FFFFFF !important; /* White text */
        }
        .nav-link {
            color: #FFFFFF !important; /* White text */
        }
        .container {
            max-width: 800px; /* Limiting container width for better readability */
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5); /* 90% transparent white background */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Darker shadow effect */
            border-radius: 10px; /* Rounded corners */
        }
        .btn-custom {
            color: #FFFFFF;
            background-color: #884EA0; /* Purple */
            border-color: #884EA0;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #633974; /* Darker Purple on hover */
            border-color: #633974;
        }
        .summary-box {
            margin-bottom: 20px;
        }
        .summary-box h3 {
            color: #5B2C6F; /* Dark olive green */
            text-align: center;
            margin-bottom: 20px;
        }
        .summary-box .summary-content {
            text-align: center;
        }
        .add-user-button {
            text-align: left;
            margin-bottom: 10px; /* Adjust margin for spacing */
        }
        /* Table styling */
        .table-custom {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .table-custom th,
        .table-custom td {
            padding: 12px 15px;
            text-align: center;
            vertical-align: middle;
        }
        .table-custom thead {
            background-color: #884EA0; /* Purple */
            color: #FFFFFF;
        }
        .table-custom tbody tr:nth-child(even) {
            background-color: rgba(136, 78, 160, 0.1); /* Lighter Purple */
        }
        .table-custom tbody tr:hover {
            background-color: rgba(136, 78, 160, 0.2); /* Light Purple on hover */
        }
        .table-custom .btn {
            padding: 6px 12px;
            font-size: 14px;
        }
        .table-custom .btn-primary {
            background-color: #633974; /* Darker Purple */
            border-color: #633974;
        }
        .table-custom .btn-primary:hover {
            background-color: #5B2C6F; /* Slightly Darker Purple on hover */
            border-color: #5B2C6F;
        }
        .table-custom .btn-danger {
            background-color: #E74C3C; /* Red */
            border-color: #E74C3C;
        }
        .table-custom .btn-danger:hover {
            background-color: #C0392B; /* Darker Red on hover */
            border-color: #C0392B;
        }
    </style>
</head>
<body>

<div class="top-bar"></div> <!-- Purple top bar -->

<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand">LEAVE MANAGEMENT SYSTEM</a>
        </div>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a>
            </li>
        </ul>
    </nav>
</header>

<header>
    <br>
    <h3 class="text-center">Welcome, ${user.username}!</h3>
    <hr>
    <div class="text-center">
        <p>You are logged in to the Leave Management System.</p>
    </div>
</header>

<div class="container">
    <div class="summary-box">
        <h3>Summary</h3>
        <div class="summary-content">
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Reason for Leave</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="leaveUser" items="${listLeaveUsers}">
                    <tr>
                        <td><c:out value="${leaveUser.id}" /></td>
                        <td><c:out value="${leaveUser.name}" /></td>
                        <td><c:out value="${leaveUser.reasonfl}" /></td>
                        <td><c:out value="${leaveUser.status}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${leaveUser.id}' />" class="btn btn-primary btn-sm">Edit</a>
                            <a href="delete?id=<c:out value='${leaveUser.id}' />" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Positioning the Add New User button under the table -->
    <div class="add-user-button">
        <a href="<%=request.getContextPath()%>/new" class="btn btn-custom">Add New Leave</a>
    </div>
</div>

</body>
</html>
