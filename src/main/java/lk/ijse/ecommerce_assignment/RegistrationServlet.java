package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.UserDTO;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegistrationServlet", value = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String status = req.getParameter("status");

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        UserDTO user = new UserDTO(username, email, hashedPassword, role, status);

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO users (userName, email, password, role, status) VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, user.getUsername());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getPassword());
                statement.setString(4, user.getRole());
                statement.setString(5, user.getStatus());

                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    // Success response
                    req.getSession().setAttribute("message", "Registration successful. Please log in.");
                    req.getSession().setAttribute("alertType", "success");
                    resp.sendRedirect("index.jsp");
                } else {
                    // Fail response
                    req.getSession().setAttribute("message", "Registration failed. Please try again.");
                    req.getSession().setAttribute("alertType", "danger");
                    resp.sendRedirect("registration.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.getSession().setAttribute("message", "Database error: " + e.getMessage());
            req.getSession().setAttribute("alertType", "danger");
            resp.sendRedirect("registration.jsp");
        }
    }
}