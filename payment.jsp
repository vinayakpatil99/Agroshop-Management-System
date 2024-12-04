<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            background: #f4f4f9;
            font-family: 'Poppins', Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Header Section */
        header {
            background: linear-gradient(90deg, #8e44ad, #3498db);
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 36px;
            margin: 0;
            font-weight: bold;
        }

        /* Marquee Section */
        marquee {
            background: #3498db;
            color: white;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 5px;
        }

        /* Main Card Design */
        .card {
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            border: none;
            background: white;
            border-radius: 10px;
        }

        /* Button Styles */
        .btn-custom {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 50px;
            font-weight: bold;
            padding: 15px 40px;
            font-size: 18px;
            text-transform: uppercase;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #2ecc71;
            box-shadow: 0px 8px 20px rgba(46, 204, 113, 0.6);
            transform: scale(1.1);
        }

        .btn-back {
            background-color: #e67e22;
            color: white;
            border-radius: 50px;
            font-weight: bold;
            padding: 10px 20px;
            text-transform: uppercase;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-back:hover {
            background-color: #d35400;
            box-shadow: 0px 8px 20px rgba(211, 84, 0, 0.6);
            transform: scale(1.1);
        }

        /* Footer */
        footer {
            margin-top: 30px;
            text-align: center;
            color: #777;
            font-size: 14px;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Payment Management</h1>
    </header>

    <!-- Interactive Marquee -->
    <marquee behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
        Welcome to the <b>Payment Management</b>! Manage payments easily and efficiently with our advanced tools.
    </marquee>

    <!-- Main Container -->
    <div class="container mt-5">
        <div class="row">
            <!-- Back Button -->
            <div class="col-12 mb-3">
                <a href="dashboard.jsp" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card p-5">
                    <h2 class="text-center text-success mb-4">Manage Payments</h2>

                    <!-- Buttons with Side-by-Side Layout -->
                    <div class="d-flex justify-content-center gap-4 flex-wrap">
                        <a href="addPayment.jsp" class="btn btn-custom">
                            <i class="fas fa-plus"></i> Add Payment
                        </a>
                        <a href="PaymentServlet?action=list" class="btn btn-custom">
                            <i class="fas fa-list"></i> List Payments
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

   

    <!-- Bootstrap JS and Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
