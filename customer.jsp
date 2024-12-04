<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agro Shop Management</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #a8ff78, #78ffd6);
            color: #333;
            overflow-x: hidden;
        }

        /* Header Section */
        header {
            text-align: center;
            padding: 30px 20px;
            background-color: #007bff;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 2.5em;
            animation: slide-in 1s ease-out;
        }

        header p {
            font-size: 1.2em;
            margin: 10px 0 0;
        }

        /* Marquee Section */
        .marquee {
            background-color: #f8f9fa;
            padding: 10px 0;
            font-size: 1.5em;
            color: #007bff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Navigation Bar */
        nav {
            text-align: center;
            margin: 20px 0;
        }

        nav a {
            text-decoration: none;
            font-size: 1.2em;
            color: #007bff;
            margin: 0 15px;
            padding: 10px 20px;
            border: 2px solid #007bff;
            border-radius: 50px;
            transition: all 0.3s ease;
            display: inline-block;
        }

        nav a:hover {
            background-color: #007bff;
            color: white;
            transform: scale(1.1);
        }

        /* Keyframe Animations */
        @keyframes slide-in {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header h1 {
                font-size: 2em;
            }

            nav a {
                font-size: 1em;
                margin: 10px;
            }
        }

        /* Interactive button styles */
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            text-decoration: none;
            font-size: 1.2em;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        /* Back Button Style */
        .back-btn {
            background-color: #28a745;
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            font-size: 1.2em;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: #218838;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Welcome to Agro Shop Management System</h1>
        <p>Effortlessly manage your agro shop with modern tools and features.</p>
    </header>

    <!-- Marquee Section -->
    <div class="marquee">
        <marquee behavior="scroll" direction="left">🚜 Shop and manage your agricultural products, orders, and customers with ease! 🌱</marquee>
    </div>

    <!-- Navigation Bar -->
    <nav>
        <a href="CustomerServlet?action=list" class="btn">Manage Customers</a>
    </nav>

    <!-- Back Button Section -->
    <div style="text-align: center;">
        <a href="dashboard.jsp" class="back-btn">Back</a>
    </div>

</body>
</html>
