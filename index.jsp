<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f0f4ff, #dff6ff);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 2.5em;
            color: #333;
            animation: fadeInDown 1s ease-in-out;
        }

        .button-container {
            margin: 20px auto;
            text-align: center;
        }

        .button-container a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        .button-container a:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        /* Back to Dashboard Button */
        .back-btn-container {
            display: flex;
            justify-content: flex-end;
            width: 100%;
            margin: 20px;
        }

        .back-btn {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 10px;
        }

        table, th, td {
            border: none;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
            text-transform: uppercase;
            font-weight: 500;
        }

        tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        td a {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 0.9em;
            color: white;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        td a.edit {
            background-color: #28a745;
        }

        td a.delete {
            background-color: #dc3545;
        }

        td a:hover {
            transform: scale(1.1);
        }

        td a.edit:hover {
            background-color: #218838;
        }

        td a.delete:hover {
            background-color: #c82333;
        }

        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        tr {
            animation: fadeIn 0.5s ease-in-out;
        }
    </style>
</head>
<body>
    <h1>Product Management</h1>

    <!-- Back to Dashboard Button -->
    <div class="back-btn-container">
        <a href="dashboard.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    <div class="button-container">
        <a href="addProduct.jsp"><i class="fas fa-plus"></i> Add Product</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agroshop5", "root", "Vinayak@1728");
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM product";
                    ResultSet rs = stmt.executeQuery(query);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td>₹<%= rs.getBigDecimal("price") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td>
                    <a href="editProduct.jsp?id=<%= rs.getInt("id") %>" class="edit"><i class="fas fa-edit"></i> Edit</a>
                    <a href="ProductServlet?action=delete&id=<%= rs.getInt("id") %>" class="delete"><i class="fas fa-trash"></i> Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
</body>
</html>
