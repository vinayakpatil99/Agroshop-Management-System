package agro;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/agroshop5";
    private static final String DB_USER = "root"; // replace with your MySQL username
    private static final String DB_PASSWORD = "Vinayak@1728"; // replace with your MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username cannot be empty.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Password cannot be empty.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Check if username exists
            String userQuery = "SELECT * FROM admin WHERE username = ?";
            PreparedStatement userStmt = conn.prepareStatement(userQuery);
            userStmt.setString(1, username);
            ResultSet userRs = userStmt.executeQuery();

            if (!userRs.next()) {
                // Username does not exist
                request.setAttribute("errorMessage", "Username is incorrect. Please enter a valid username.");
                request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
            } else {
                // Username exists, now check password
                String passwordQuery = "SELECT * FROM admin WHERE username = ? AND password = ?";
                PreparedStatement passwordStmt = conn.prepareStatement(passwordQuery);
                passwordStmt.setString(1, username);
                passwordStmt.setString(2, password);
                ResultSet passwordRs = passwordStmt.executeQuery();

                if (!passwordRs.next()) {
                    // Password is incorrect
                    request.setAttribute("errorMessage", "Password is incorrect. Please enter a valid password.");
                    request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
                } else {
                    // Both username and password are correct
                    response.sendRedirect("thankyou.jsp");  // Redirect to admin dashboard
                }
            }
        } catch (Exception e) {
            // Handle database connection issues or other exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }
}
