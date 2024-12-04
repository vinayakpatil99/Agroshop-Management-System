<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgroShop Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding-top: 20px;
            transition: all 0.3s ease;
        }
        .sidebar h2 {
            text-align: center;
            font-size: 1.5rem;
            padding: 15px;
            background-color: #34495e;
        }
        .sidebar a {
            color: #ecf0f1;
            display: block;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background-color: #16a085;
            color: #fff;
        }
        .main-content {
            margin-left: 250px;
            padding: 30px;
            transition: margin-left 0.3s;
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        .toggle-btn {
            display: none;
            position: absolute;
            top: 15px;
            left: 15px;
            font-size: 1.5rem;
            cursor: pointer;
        }
        .profile-section {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .profile-section h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .profile-section p {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }
        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 60px;
            }
            .main-content {
                margin-left: 60px;
            }
            .toggle-btn {
                display: block;
            }
            .sidebar a {
                font-size: 0.9rem;
                padding: 12px;
            }
        }
        /* Marquee Styles */
        .marquee {
            font-size: 1.5rem;
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            background-color: #16a085;
            border-radius: 5px;
            text-align: center;
            overflow: hidden;
            position: relative;
        }
        .marquee span {
            display: inline-block;
            animation: marquee 10s linear infinite;
        }
        @keyframes marquee {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(-100%);
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>AgroShop</h2>
        <a href="index.jsp"><i class="fas fa-seedling"></i> Products</a>
        <a href="customer.jsp"><i class="fas fa-users"></i> Customers</a>
        <a href="payment.jsp"><i class="fas fa-credit-card"></i> Payments</a>
        <a href="AdminLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Marquee Section -->
        <div class="marquee">
            <span><b><h2>Welcome to the AgroShop Admin Dashboard!</h2></b></span>
        </div>

        <!-- Navbar -->
        <nav class="navbar navbar-light bg-light shadow-sm mb-4">
            <span class="navbar-brand mb-0 h1">Admin Dashboard</span>
            <button class="toggle-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
        </nav>
        
        <!-- Admin Profile Section -->
        <div class="profile-section">
            <h3>Admin Profile</h3>
            <p><strong>Name:</strong>KKAgro</p>
            <p><strong>Email:</strong> kkagro@gmail.com</p>
            <p><strong>Role:</strong>Shop Owner</p>
        </div>

        <!-- Cards Section -->
        <div class="container">
            <div class="row mb-4">
                <!-- Product Management -->
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Products</h5>
                            <p class="card-text">Manage product listings, add new products, and update existing ones.</p>
                            <a href="index.jsp" class="btn btn-light"><i class="fas fa-seedling"></i> Manage Products</a>
                        </div>
                    </div>
                </div>

                <!-- Customer Management -->
                <div class="col-md-4">
                    <div class="card text-white bg-info mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Customers</h5>
                            <p class="card-text">View and manage customer accounts and data.</p>
                            <a href="customer.jsp" class="btn btn-light"><i class="fas fa-users"></i> Manage Customers</a>
                        </div>
                    </div>
                </div>

                <!-- Payment Management -->
                <div class="col-md-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Payments</h5>
                            <p class="card-text">Manage and view all customer payments and transactions.</p>
                            <a href="payment.jsp" class="btn btn-light"><i class="fas fa-credit-card"></i> Manage Payments</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        // Sidebar Toggle Function
        function toggleSidebar() {
            document.querySelector('.sidebar').classList.toggle('collapsed');
            document.querySelector('.main-content').classList.toggle('expanded');
        }
    </script>
</body>
</html>
