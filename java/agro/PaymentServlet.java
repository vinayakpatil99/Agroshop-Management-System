package agro;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/agroshop5";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Vinayak@1728";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list"; // Default action is to list payments

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            switch (action) {
                case "edit":
                    editPayment(request, response, conn);
                    break;
                case "delete":
                    deletePayment(request, response, conn);
                    break;
                default:
                    listPayments(request, response, conn);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String customerName = request.getParameter("customerName");
        String productName = request.getParameter("productName");
        String amount = request.getParameter("amount");
        String paymentDate = request.getParameter("paymentDate");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            if (id == null || id.isEmpty()) {
                // Add a new payment
                try (PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO payment (customer_name, product_name, amount, payment_date) VALUES (?, ?, ?, ?)")) {
                    stmt.setString(1, customerName);
                    stmt.setString(2, productName);
                    stmt.setBigDecimal(3, new BigDecimal(amount));
                    stmt.setDate(4, Date.valueOf(paymentDate));
                    stmt.executeUpdate();
                }
            } else {
                // Update an existing payment
                try (PreparedStatement stmt = conn.prepareStatement(
                        "UPDATE payment SET customer_name = ?, product_name = ?, amount = ?, payment_date = ? WHERE id = ?")) {
                    stmt.setString(1, customerName);
                    stmt.setString(2, productName);
                    stmt.setBigDecimal(3, new BigDecimal(amount));
                    stmt.setDate(4, Date.valueOf(paymentDate));
                    stmt.setInt(5, Integer.parseInt(id));
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("PaymentServlet");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listPayments(HttpServletRequest request, HttpServletResponse response, Connection conn) throws ServletException, IOException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM payment")) {
            ResultSet rs = stmt.executeQuery();
            request.setAttribute("payments", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("listPayments.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void editPayment(HttpServletRequest request, HttpServletResponse response, Connection conn) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM payment WHERE id = ?")) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("payment", rs);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editPayment.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("PaymentServlet");
            }
        } catch (SQLException e) {
            throw new ServletException("Error retrieving payment data", e);
        }
    }

    private void deletePayment(HttpServletRequest request, HttpServletResponse response, Connection conn) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM payment WHERE id = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            response.sendRedirect("PaymentServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
