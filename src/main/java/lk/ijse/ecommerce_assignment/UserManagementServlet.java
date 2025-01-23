package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.UserDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserManagementServlet", value = "/user-manage")
public class UserManagementServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String username = req.getParameter("username");

        try (Connection connection = dataSource.getConnection()) {
            if ("toggleStatus".equalsIgnoreCase(action) && username != null) {
                String currentStatus = fetchUserStatus(connection, username);
                if (currentStatus != null) {
                    String newStatus = "Deactive".equalsIgnoreCase(currentStatus) ? "Active" : "Deactive";
                    updateUserStatus(connection, username, newStatus);

                    req.getSession().setAttribute("message", newStatus + " successfully");
                    req.getSession().setAttribute("messageType", "success");

                    resp.sendRedirect(req.getRequestURI());
                    return;
                } else {
                    req.getSession().setAttribute("message", "User not found.");
                    req.getSession().setAttribute("messageType", "error");
                }
            }

            List<UserDTO> users = fetchAllUsers(connection);
            req.setAttribute("users", users);

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("message", "Error occurred while processing your request.");
            req.setAttribute("messageType", "error");
        }

        req.getRequestDispatcher("/user_management.jsp").forward(req, resp);
    }

    private List<UserDTO> fetchAllUsers(Connection connection) throws SQLException {
        List<UserDTO> users = new ArrayList<>();
        String sql = "SELECT userId, userName, email, role, status FROM users";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                UserDTO user = new UserDTO();
                user.setUserId(resultSet.getInt("userId"));
                user.setUsername(resultSet.getString("userName"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                user.setStatus(resultSet.getString("status"));
                users.add(user);
            }
        }
        return users;
    }

//    public class IDGenerator {
//        public static void main(String[] args) {
//            // Generate a random UUID
//            UserDTO uniqueKey = UserDTO.randomUserId();
//
//            // Print the unique ID (UUID)
//            System.out.println("Generated ID: " + uniqueKey.toString());
//        }
//    }
    private void updateUserStatus(Connection connection, String username, String newStatus) throws SQLException {
        String updateStatusQuery = "UPDATE users SET status = ? WHERE userName = ?";
        try (PreparedStatement updateStatusStmt = connection.prepareStatement(updateStatusQuery)) {
            updateStatusStmt.setString(1, newStatus);
            updateStatusStmt.setString(2, username);
            updateStatusStmt.executeUpdate();
        }
    }

    private String fetchUserStatus(Connection connection, String username) throws SQLException {
        String query = "SELECT status FROM users WHERE userName = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("status");
            }
        }
        return null;
    }
}
