package agro;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Delegate POST requests to doGet for simplicity
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp"); // Default redirection to the product list page
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if an exception occurs
        }
    }

    /**
     * Adds a new product to the database.
     */
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection conn = getConnection();
        String query = "INSERT INTO product (name, price, description, quantity) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);

        stmt.setString(1, name);
        stmt.setBigDecimal(2, price);
        stmt.setString(3, description);
        stmt.setInt(4, quantity);
        stmt.executeUpdate();

        stmt.close();
        conn.close();

        response.sendRedirect("index.jsp");
    }

    /**
     * Updates an existing product in the database.
     */
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection conn = getConnection();
        String query = "UPDATE product SET name=?, price=?, description=?, quantity=? WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(query);

        stmt.setString(1, name);
        stmt.setBigDecimal(2, price);
        stmt.setString(3, description);
        stmt.setInt(4, quantity);
        stmt.setInt(5, id);
        stmt.executeUpdate();

        stmt.close();
        conn.close();

        response.sendRedirect("index.jsp");
    }

    /**
     * Deletes a product from the database.
     */
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = getConnection();
        String query = "DELETE FROM product WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(query);

        stmt.setInt(1, id);
        stmt.executeUpdate();

        stmt.close();
        conn.close();

        response.sendRedirect("index.jsp");
    }

    /**
     * Establishes a connection to the database.
     */
    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/agroshop5";
        String username = "root";
        String password = "Vinayak@1728";

        // Load the MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }
}
