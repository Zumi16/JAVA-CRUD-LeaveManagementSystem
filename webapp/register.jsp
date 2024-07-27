<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Leave Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Prevents the image from creating scroll bars */
            background-color: #f8f9fa; /* Light gray background color */
            background-image: url('https://i.pinimg.com/originals/dc/0b/e1/dc0be1e02f1aa1f113b217facb3a9109.gif'); /* Background image */
            background-size: cover;
            background-position: center;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .background-gif {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Behind other content */
            pointer-events: none; /* Allows clicking through the background */
        }
        .card {
            margin-top: 0vh; /* Adjusted margin top to be 10% of viewport height */
            background-color: rgba(255, 255, 255, 0.3); /* 90% transparent background */
            border: none;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.8); /* Darker shadow */
            max-width: 400px; /* Set maximum width for smaller box */
            height: auto; /* Allow height to adjust based on content */
            z-index: 1; /* Ensure card appears above the background */
            position: relative; /* Ensure it stacks correctly */
            padding: 25px; /* Adjusted padding for spacing inside the card */
        }
        .card-header {
            background-color: transparent;
            border-bottom: none;
            color: #8E44AD; /* Updated color to #8E44AD */
            text-align: center;
            font-weight: bold;
            font-size: 28px;
        }
        .card-body {
            padding: 10px; /* Reduced padding for smaller box */
        }
        .form-group {
            margin-bottom: 15px; /* Reduced margin-bottom for smaller spacing */
            position: relative; /* Positioning context for icons */
        }
        .form-control {
            padding-left: 40px; /* Padding to make space for icons */
            background-color: rgba(255, 255, 255, 0.5); /* 70% transparent white */
            border: none;
            border-radius: 20px; /* Rounded corners */
            position: relative;
        }
        .form-control:focus {
            box-shadow: none; /* Remove the default focus box shadow */
        }
        .form-group .bx {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #8E44AD; /* Updated color to #8E44AD */
        }
        .error-message {
            color: #FFA8F4; /* Red color for error message */
            font-size: 0.875rem; /* Slightly smaller font size for error message */
            margin-top: 2px; /* Small margin to separate error message from input */
            margin-bottom: 15px;
        }
        .btn-primary {
            background-color: #8E44AD; /* Updated color to #8E44AD */
            border-color: #8E44AD; /* Updated color to #8E44AD */
        }
        .btn-primary:hover {
            background-color: #6C3483; /* Darker shade for hover */
            border-color: #6C3483; /* Darker shade for hover */
        }
        .text-center {
            color: #fff; /* Font color white for "Already have an account?" */
        }
        .text-center a {
            color: #FFA8F4; /* Font color #8E44AD for "Login here" */
            text-decoration: none; /* Remove underline */
            font-weight: bold;
        }
        .text-center a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4"> <!-- Adjusted column width to make the box smaller -->
            <div class="card">
                <div class="card-header">
                    Register
                </div>
                <div class="card-body">
                    <form action="login" method="post">
                        <input type="hidden" name="action" value="register">

                        <div class="form-group">
                            <i class='bx bx-user'></i>
                            <input type="text" id="username" class="form-control" name="username" placeholder="Username" required>
                        </div>

                        <div class="form-group">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" id="password" class="form-control" name="password" placeholder="Password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </form>
                    <p class="mt-3 text-center">Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
