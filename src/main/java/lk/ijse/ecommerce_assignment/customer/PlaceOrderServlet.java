package lk.ijse.ecommerce_assignment.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.OrderItem;

import javax.sql.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PlaceOrderServlet", value = "/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderItem> orderItems = new ArrayList<>();
        BigDecimal total = BigDecimal.ZERO;

        try (Connection connection = dataSource.getConnection()) {
            int userId = 1;

            String query = "SELECT c.product_id, p.name, p.price, c.quantity " +
                    "FROM cart c " +
                    "JOIN product p ON c.product_id = p.product_id " +
                    "WHERE c.user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                String productName = resultSet.getString("name");
                BigDecimal price = resultSet.getBigDecimal("price");
                int quantity = resultSet.getInt("quantity");

                OrderItem item = new OrderItem(productId, productName, price, quantity);
                orderItems.add(item);

                total = total.add(item.getTotal());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Pass data to the JSP
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("total", total);
        request.getRequestDispatcher("order_placement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection connection = dataSource.getConnection()) {
            int userId = 1;

            String insertOrderQuery = "INSERT INTO orders (user_id, total_price, order_status, created_at) VALUES (?, ?, ?, ?)";
            PreparedStatement orderStatement = connection.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            BigDecimal total = BigDecimal.ZERO;

            // Fetch cart items to calculate the total
            String fetchCartQuery = "SELECT c.product_id, p.price, c.quantity " +
                    "FROM cart c " +
                    "JOIN product p ON c.product_id = p.product_id " +
                    "WHERE c.user_id = ?";
            PreparedStatement fetchCartStatement = connection.prepareStatement(fetchCartQuery);
            fetchCartStatement.setInt(1, userId);

            ResultSet cartResultSet = fetchCartStatement.executeQuery();
            while (cartResultSet.next()) {
                BigDecimal price = cartResultSet.getBigDecimal("price");
                int quantity = cartResultSet.getInt("quantity");
                total = total.add(price.multiply(BigDecimal.valueOf(quantity)));
            }

            // Add the order details
            orderStatement.setInt(1, userId);
            orderStatement.setBigDecimal(2, total);
            orderStatement.setString(3, "Pending");
            orderStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            orderStatement.executeUpdate();

            ResultSet generatedKeys = orderStatement.getGeneratedKeys();
            int orderId = 0;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            String insertOrderDetailsQuery = "INSERT INTO order_details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement orderDetailsStatement = connection.prepareStatement(insertOrderDetailsQuery);

            cartResultSet.beforeFirst();
            while (cartResultSet.next()) {
                int productId = cartResultSet.getInt("product_id");
                BigDecimal price = cartResultSet.getBigDecimal("price");
                int quantity = cartResultSet.getInt("quantity");

                orderDetailsStatement.setInt(1, orderId);
                orderDetailsStatement.setInt(2, productId);
                orderDetailsStatement.setInt(3, quantity);
                orderDetailsStatement.setBigDecimal(4, price);
                orderDetailsStatement.addBatch();
            }

            orderDetailsStatement.executeBatch();

            String clearCartQuery = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement clearCartStatement = connection.prepareStatement(clearCartQuery);
            clearCartStatement.setInt(1, userId);
            clearCartStatement.executeUpdate();

            response.sendRedirect("order_success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
