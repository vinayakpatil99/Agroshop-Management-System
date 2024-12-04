<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: linear-gradient(to right, #4CAF50, #87CEEB);
            margin: 0;
            padding: 0;
            color: white;
        }
        .container {
            max-width: 400px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
            color: #333;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.03);
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            color: #087f23;
        }
    </style>
</head>
<body>
    <!-- Form Container -->
    <div class="container">
        <h1>Edit Payment</h1>
        <form action="PaymentServlet" method="post">
            <%
                ResultSet payment = (ResultSet) request.getAttribute("payment");
                String id = "", customerName = "", productName = "", amount = "", paymentDate = "";
                if (payment != null && payment.next()) {
                    id = String.valueOf(payment.getInt("id"));
                    customerName = payment.getString("customer_name");
                    productName = payment.getString("product_name");
                    amount = String.valueOf(payment.getBigDecimal("amount"));
                    paymentDate = String.valueOf(payment.getDate("payment_date"));
                }
            %>
            <!-- Hidden ID Field -->
            <input type="hidden" name="id" value="<%= id %>">
            
            <!-- Customer Name -->
            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" id="customerName" value="<%= customerName %>" required>
            
            <!-- Product Name -->
            <label for="productName">Product Name:</label>
            <input type="text" name="productName" id="productName" value="<%= productName %>" required>
            
            <!-- Amount -->
            <label for="amount">Amount:</label>
            <input type="number" step="0.01" name="amount" id="amount" value="<%= amount %>" required>
            
            <!-- Payment Date -->
            <label for="paymentDate">Payment Date:</label>
            <input type="date" name="paymentDate" id="paymentDate" value="<%= paymentDate %>" required>
            
            <!-- Submit Button -->
            <input type="submit" value="Update Payment">
        </form>
        <!-- Back to List -->
        <a href="PaymentServlet" class="back-link">Back to List</a>
    </div>
</body>
</html>
