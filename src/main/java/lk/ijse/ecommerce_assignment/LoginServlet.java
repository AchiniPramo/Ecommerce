package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        try (Connection connection = dataSource.getConnection()) {  // Use injected DataSource
            String sql = "SELECT * FROM users WHERE username = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String storedPassword = resultSet.getString("password");
                    if (BCrypt.checkpw(password, storedPassword)) {
                        session.setAttribute("username", username);
                        session.setAttribute("role", resultSet.getString("role"));

                        session.setAttribute("message", "Login successful! Welcome, " + username + ".");
                        session.setAttribute("alertType", "success");

                        resp.sendRedirect("dashboard.jsp");
                    } else {
                        session.setAttribute("message", "Invalid credentials, please try again.");
                        session.setAttribute("alertType", "danger");
                        resp.sendRedirect("index.jsp");
                    }
                } else {
                    session.setAttribute("message", "User not found.");
                    session.setAttribute("alertType", "danger");
                    resp.sendRedirect("index.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("message", "Database error: " + e.getMessage());
            session.setAttribute("alertType", "danger");
            resp.sendRedirect("index.jsp");
        }
    }
}
