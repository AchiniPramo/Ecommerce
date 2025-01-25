package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.OrderDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderManagementServlet", value = "/order-manage")
public class OrderManagementServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderDTO> orders = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT o.order_id, u.userName, o.total_price, o.order_status, o.created_at " +
                    "FROM orders o " +
                    "JOIN users u ON o.user_id = u.userId";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                String customerName = resultSet.getString("userName");
                BigDecimal totalPrice = resultSet.getBigDecimal("total_price");
                String orderStatus = resultSet.getString("order_status");
                java.sql.Timestamp createdAt = resultSet.getTimestamp("created_at");

                orders.add(new OrderDTO(orderId, customerName, totalPrice, orderStatus, createdAt));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/order_management.jsp").forward(request, response);
    }
}
