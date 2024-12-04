<%@ page import="java.sql.*" %>
<%
    ResultSet customerList = (ResultSet) request.getAttribute("customerList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List - Agro Shop Management</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Header */
        header {
            background-color: #007bff;
            color: white;
            padding: 20px 30px;
            text-align: center;
        }

        header h2 {
            margin: 0;
            font-size: 2em;
        }

        /* Container */
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Add New Customer Link */
        .add-customer-link {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .add-customer-link:hover {
            background-color: #218838;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-buttons a {
            padding: 8px 15px;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            text-align: center;
            transition: all 0.3s ease;
        }

        .action-buttons .edit-btn {
            background-color: #ffc107;
        }

        .action-buttons .edit-btn:hover {
            background-color: #e0a800;
        }

        .action-buttons .delete-btn {
            background-color: #dc3545;
        }

        .action-buttons .delete-btn:hover {
            background-color: #c82333;
        }

        /* Back Button */
        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                font-size: 0.9em;
            }

            .container {
                width: 95%;
                padding: 10px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-buttons a {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h2>Customer List</h2>
    </header>

    <!-- Main Container -->
    <div class="container">
        <a href="CustomerServlet?action=new" class="add-customer-link">Add New Customer</a>

        <!-- Customer Table -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (customerList != null && customerList.next()) {
                %>
                    <tr>
                        <td><%= customerList.getInt("id") %></td>
                        <td><%= customerList.getString("name") %></td>
                        <td><%= customerList.getString("email") %></td>
                        <td><%= customerList.getString("phone") %></td>
                        <td><%= customerList.getString("address") %></td>
                        <td class="action-buttons">
                            <a href="CustomerServlet?action=edit&id=<%= customerList.getInt("id") %>" class="edit-btn">Edit</a>
                            <a href="CustomerServlet?action=delete&id=<%= customerList.getInt("id") %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Back Button -->
        <a href="customer.jsp" class="back-btn">Back</a>

    </div>

</body>
</html>
