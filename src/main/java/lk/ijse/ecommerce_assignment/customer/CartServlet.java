package lk.ijse.ecommerce_assignment.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.CartItem;

import javax.sql.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CartItem> cartItems = new ArrayList<>();
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

                CartItem item = new CartItem(productId, productName, price, quantity);
                cartItems.add(item);

                total = total.add(item.getTotal());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = dataSource.getConnection()) {
            int userId = 1;

            if (action != null) {
                if (action.startsWith("remove-")) {
                    int productId = Integer.parseInt(action.split("-")[1]);
                    String query = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setInt(1, userId);
                    preparedStatement.setInt(2, productId);
                    preparedStatement.executeUpdate();
                } else if ("checkout".equals(action)) {
                    String query = "DELETE FROM cart WHERE user_id = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setInt(1, userId);
                    preparedStatement.executeUpdate();
                } else {
                    for (String key : request.getParameterMap().keySet()) {
                        if (key.startsWith("quantity[")) {
                            int productId = Integer.parseInt(key.replaceAll("\\D", ""));
                            int quantity = Integer.parseInt(request.getParameter(key));
                            String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                            PreparedStatement preparedStatement = connection.prepareStatement(query);
                            preparedStatement.setInt(1, quantity);
                            preparedStatement.setInt(2, userId);
                            preparedStatement.setInt(3, productId);
                            preparedStatement.executeUpdate();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart");
    }
}
