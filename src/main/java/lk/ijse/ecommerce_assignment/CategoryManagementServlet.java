package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lk.ijse.ecommerce_assignment.dto.CategoryDTO;

@WebServlet(name = "CategoryManagementServlet", value = "/category-manage")
public class CategoryManagementServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryDTO> categoryList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM categories")) {

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                categoryList.add(new CategoryDTO(id, name, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load categories");
            return;
        }

        request.setAttribute("categories", categoryList);
        request.getRequestDispatcher("/category_management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            switch (action) {
                case "add":
                    handleAddCategory(request, response, connection);
                    break;
                case "edit":
                    handleEditCategory(request, response, connection);
                    break;
                case "delete":
                    handleDeleteCategory(request, response, connection);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }

    private void handleAddCategory(HttpServletRequest request, HttpServletResponse response, Connection connection) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        if (name == null || description == null || name.isEmpty() || description.isEmpty()) {
            setMessage(request, "Invalid input for adding category", "danger");
            response.sendRedirect("category-manage");
            return;
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO categories (name, description) VALUES (?, ?)")) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.executeUpdate();
            setMessage(request, "Category added successfully!", "success");
            response.sendRedirect("category-manage");
        } catch (Exception e) {
            e.printStackTrace();
            setMessage(request, "Failed to add category", "danger");
            response.sendRedirect("category_management.jsp");
        }
    }

    private void handleEditCategory(HttpServletRequest request, HttpServletResponse response, Connection connection) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        if (id == null || name == null || description == null || id.isEmpty() || name.isEmpty() || description.isEmpty()) {
            setMessage(request, "Invalid input for editing category", "danger");
            response.sendRedirect("category");
            return;
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE categories SET name = ?, description = ? WHERE category_id = ?")) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, Integer.parseInt(id));
            preparedStatement.executeUpdate();
            setMessage(request, "Category updated successfully!", "success");
            response.sendRedirect("category-manage");
        } catch (Exception e) {
            e.printStackTrace();
            setMessage(request, "Failed to edit category", "danger");
            response.sendRedirect("category-manage");
        }
    }

    private void handleDeleteCategory(HttpServletRequest request, HttpServletResponse response, Connection connection) throws IOException {
        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            setMessage(request, "Invalid input for deleting category", "danger");
            response.sendRedirect("category-manage");
            return;
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM categories WHERE category_id = ?")) {

            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.executeUpdate();
            setMessage(request, "Category deleted successfully!", "success");
            response.sendRedirect("category-manage");
        } catch (Exception e) {
            e.printStackTrace();
            setMessage(request, "Failed to delete category", "danger");
            response.sendRedirect("category-manage");
        }
    }
    private void setMessage(HttpServletRequest request, String message, String type) {
        request.getSession().setAttribute("message", message);
        request.getSession().setAttribute("messageType", type);
    }
}
