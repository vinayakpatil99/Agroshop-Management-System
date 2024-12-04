<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        form {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            width: 400px;
            animation: fadeIn 0.6s ease-in-out;
            position: relative;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        form h1 {
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input, textarea, button {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #4facfe;
            outline: none;
            box-shadow: 0 0 5px rgba(79, 172, 254, 0.6);
        }

        textarea {
            resize: none;
        }

        button {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #fff;
            font-weight: bold;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        button:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
            transform: scale(1.05);
        }

        .tooltip {
            position: absolute;
            top: -10px;
            right: -10px;
            background: #0072ff;
            color: #fff;
            font-size: 12px;
            padding: 5px 10px;
            border-radius: 8px;
            display: none;
            z-index: 10;
        }

        input:hover + .tooltip, textarea:hover + .tooltip {
            display: block;
        }

        .tooltip::after {
            content: '';
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translateX(-50%);
            border-width: 5px;
            border-style: solid;
            border-color: #0072ff transparent transparent transparent;
        }

        .back-button {
            position: absolute;
            top: 15px;
            left: 15px;
            background: #f4f4f9;
            border: none;
            color: #0072ff;
            font-weight: bold;
            padding: 5px 15px;
            border-radius: 8px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .back-button:hover {
            background: #e0e0e0;
        }
    </style>
</head>
<body>
    <%
        int id = 0;
        String name = "";
        String description = "";
        BigDecimal price = BigDecimal.ZERO;
        int quantity = 0;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("errorPage.jsp?message=Invalid Product ID");
                return;
            }
            id = Integer.parseInt(idParam);

            String url = "jdbc:mysql://localhost:3306/agroshop5";
            String dbUser = "root";
            String dbPassword = "Vinayak@1728";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String query = "SELECT * FROM product WHERE id=?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                price = rs.getBigDecimal("price") != null ? rs.getBigDecimal("price") : BigDecimal.ZERO;
                description = rs.getString("description");
                quantity = rs.getInt("quantity");
            } else {
                response.sendRedirect("errorPage.jsp?message=Product Not Found");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message=Database Error");
            return;
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <form action="ProductServlet?action=update" method="post">
        <button type="button" class="back-button" onclick="window.history.back();">Back</button>
        <h1>Edit Product</h1>
        <input type="hidden" name="id" value="<%= id %>">

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= name %>" required>
        <span class="tooltip">Enter the product name</span>

        <label for="price">Price:</label>
        <input type="number" step="0.01" name="price" id="price" value="<%= price %>" required>
        <span class="tooltip">Enter the price (e.g., 100.00)</span>

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" required><%= description %></textarea>
        <span class="tooltip">Provide a short product description</span>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" id="quantity" value="<%= quantity %>" required>
        <span class="tooltip">Enter available stock quantity</span>

        <button type="submit">Update Product</button>
    </form>
</body>
</html>
