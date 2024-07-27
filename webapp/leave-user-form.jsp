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
            color: #5B2C6F; /* Dark olive green */
            margin: 0;
            padding: 0;
            background: url('https://i.pinimg.com/originals/dc/0b/e1/dc0be1e02f1aa1f113b217facb3a9109.gif') no-repeat fixed; /* Background image */
            background-size: cover;
            background-position: center;
            height: 100vh; /* Ensure body covers viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .navbar {
            background-color: #5E4B66;
            height: 50px; /* Height of the top bar */
            width: 100%; /* Full width */
            position: fixed; /* Fix the navbar to the top */
            top: 0; /* Position the navbar at the top */
            z-index: 1; /* Ensure the navbar stays on top of other content */
        }
        .navbar-brand {
            color: #FFFFFF !important; /* White text */
        }
        .nav-link {
            color: #FFFFFF !important; /* White text */
        }
        .container {
            margin-top: 30px; /* Increase margin to move the container lower */
            max-width: 400px;
            padding: 30px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Lighter shadow */
        }
        .header {
            text-align: center;
            color: #8E44AD; /* Purple color for header */
            font-size: 32px; /* Larger font size */
            font-weight: bold;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 20px;
            padding-left: 20px;
        }
        .btn-primary {
            background-color: #8E44AD; /* Purple background color */
            border-color: #8E44AD; /* Purple border color */
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #6C3483; /* Darker purple on hover */
            border-color: #5B2C6F; /* Darker purple border on hover */
        }
        .text-center {
            color: #333;
            font-size: 14px;
            margin-top: 20px;
        }
        .text-center a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar">
        <a href="https://www.javaguides.net" class="navbar-brand">LEAVE MANAGEMENT SYSTEM</a>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="<%=request.getContextPath()%>/list" class="nav-link">> Back</a>
            </li>
        </ul>
    </nav>
</header>

<div class="container">
    <c:if test="${leaveUser != null}">
        <form action="<%=request.getContextPath()%>/update" method="post">
    </c:if>
    <c:if test="${leaveUser == null}">
        <form action="<%=request.getContextPath()%>/insert" method="post">
    </c:if>

    <h2 class="header text-center">
        <c:if test="${leaveUser != null}">
            <span style="color: #633974; font-size: 32px;">Edit Leave</span>
        </c:if>
        <c:if test="${leaveUser == null}">
            <span style="color: #633974; font-size: 32px;">Add New Leave</span>
        </c:if>
    </h2>

    <c:if test="${leaveUser != null}">
        <input type="hidden" name="id" value="<c:out value='${leaveUser.id}' />" />
    </c:if>

    <div class="form-group">
        <label for="name">User Name</label>
        <input type="text" id="name" value="<c:out value='${leaveUser.name}' />" class="form-control" name="name" required="required">
    </div>

    <div class="form-group">
        <label for="reasonfl">Reason for Leave</label>
        <select name="reasonfl" class="form-control" required="required">
            <option value="Vacation">Vacation</option>
            <option value="Sick Leave">Sick Leave</option>
            <option value="Maternity/Paternity Leave">Maternity/Paternity Leave</option>
            <option value="Annual Leave">Annual Leave</option>
            <option value="Unpaid Leave">Unpaid Leave</option>
            <option value="Bereavement Leave">Bereavement Leave</option>
            <!-- Add more options as needed -->
        </select>
    </div>

    <div class="form-group">
        <label for="status">Status</label>
        <select name="status" class="form-control" required="required">
            <option value="Pending">Pending</option>
            <option value="Approved">Approved</option>
            <option value="Rejected">Rejected</option>
            <!-- Add more options as needed -->
        </select>
    </div>

    <button type="submit" class="btn btn-primary btn-block">Save</button>
    </form>
</div>

</body>
</html>
