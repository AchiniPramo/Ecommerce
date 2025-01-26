package lk.ijse.ecommerce_assignment.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.ecommerce_assignment.dto.UserDTO;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ProfileManageServlet", value = "/profile")
public class ProfileManageServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve input data from the request
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        HttpSession session = req.getSession(false);
        UserDTO currentUser = (session != null) ? (UserDTO) session.getAttribute("user") : null;

        if (currentUser == null) {
            session.setAttribute("message", "You must be logged in to update your profile.");
            session.setAttribute("alertType", "danger");
            req.getRequestDispatcher("profile_manage.jsp").forward(req, resp);
            return;
        }

        // Validate user_id
        if (currentUser.getUserId() <= 0) {
            session.setAttribute("message", "Unable to update profile due to invalid user ID.");
            session.setAttribute("alertType", "danger");
            req.getRequestDispatcher("profile_manage.jsp").forward(req, resp);
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            session.setAttribute("message", "Passwords do not match. Please try again.");
            session.setAttribute("alertType", "danger");
            req.getRequestDispatcher("profile_manage.jsp").forward(req, resp);
            return;
        }

        // Hash the password using BCrypt
        String hashedPassword = hashPassword(password);

        // Update user profile in the database
        try (Connection connection = dataSource.getConnection()) {
            String updateSQL = "UPDATE users SET username = ?, email = ?, password = ? WHERE userId = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, hashedPassword);
                preparedStatement.setInt(4, currentUser.getUserId());

                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    currentUser.setUsername(name);
                    currentUser.setEmail(email);
                    session.setAttribute("user", currentUser);
                    session.setAttribute("message", "Profile updated successfully.");
                    session.setAttribute("alertType", "success");
                } else {
                    session.setAttribute("message", "Failed to update profile. Please try again.");
                    session.setAttribute("alertType", "danger");
                }
            }
        } catch (SQLException e) {
            session.setAttribute("message", "An error occurred while updating your profile. Please try again later.");
            session.setAttribute("alertType", "danger");
        }

        req.getRequestDispatcher("profile_manage.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        req.getRequestDispatcher("profile_manage.jsp").forward(req, resp);
    }

    private String hashPassword(String password) {
        // Use BCrypt to hash the password
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}