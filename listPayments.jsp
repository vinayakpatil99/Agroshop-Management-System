<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
        }
        header {
            background: #4CAF50;
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .container {
            margin-top: 40px;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        table thead {
            background: #4CAF50;
            color: white;
        }
        footer {
            margin-top: 40px;
            padding: 10px;
            background: #4CAF50;
            color: white;
            text-align: center;
        }
        .btn-back {
            background-color: #ff9800;
            color: white;
            font-weight: bold;
        }
        .btn-back:hover {
            background-color: #e67e22;
            color: white;
        }
        @media (max-width: 768px) {
            .table-container {
                padding: 10px;
            }
            table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
   <b> <header>
        Payment Management
    </header></b>

    <!-- Main Container -->
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <!-- Back Button -->
            <a href="payment.jsp" class="btn btn-back">
                <i class="bi bi-arrow-left-circle"></i> Back
            </a>
            <h2 class="text-success text-center flex-grow-1">Payment Records</h2>
            <!-- Add Payment Button -->
            <a href="addPayment.jsp" class="btn btn-success">
                <i class="bi bi-plus-circle"></i> Add New Payment
            </a>
        </div>
        <div class="table-container">
            <table class="table table-hover table-bordered table-striped align-middle">
                <thead class="text-center">
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Product Name</th>
                        <th>Amount (₹)</th>
                        <th>Payment Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ResultSet payments = (ResultSet) request.getAttribute("payments");
                        if (payments != null) {
                            while (payments.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= payments.getInt("id") %></td>
                        <td><%= payments.getString("customer_name") %></td>
                        <td><%= payments.getString("product_name") %></td>
                        <td class="text-end">₹<%= payments.getBigDecimal("amount") %></td>
                        <td class="text-center"><%= payments.getDate("payment_date") %></td>
                        <td class="text-center">
                            <a href="PaymentServlet?action=edit&id=<%= payments.getInt("id") %>" 
                               class="btn btn-primary btn-sm">
                               <i class="bi bi-pencil-square"></i> Edit
                            </a>
                            <a href="PaymentServlet?action=delete&id=<%= payments.getInt("id") %>" 
                               class="btn btn-danger btn-sm" 
                               onclick="return confirm('Are you sure you want to delete this payment?');">
                               <i class="bi bi-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center text-muted">No payments found</td>
                    </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        </div>
    </div>


    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</body>
</html>
