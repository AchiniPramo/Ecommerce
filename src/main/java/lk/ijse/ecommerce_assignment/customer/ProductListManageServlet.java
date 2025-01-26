package lk.ijse.ecommerce_assignment.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment.dto.CategoryDTO;
import lk.ijse.ecommerce_assignment.dto.ProductDTO;
import lk.ijse.ecommerce_assignment.dto.ProductPhotoDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductListManageServlet", value = "/products")
@MultipartConfig
public class ProductListManageServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductDTO> products = new ArrayList<>();
        List<CategoryDTO> categories = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            // Fetch all products with their associated images
            String productSql = "SELECT p.*, pp.photo_id, pp.photo_url " +
                    "FROM product p " +
                    "LEFT JOIN product_photos pp ON p.product_id = pp.product_id " +
                    "ORDER BY p.product_id";

            try (PreparedStatement stmt = connection.prepareStatement(productSql);
                 ResultSet rs = stmt.executeQuery()) {

                int currentProductId = -1;
                ProductDTO currentProduct = null;

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    if (productId != currentProductId) {
                        if (currentProduct != null) {
                            products.add(currentProduct); // Add the last product
                        }

                        // Create a new ProductDTO
                        currentProduct = new ProductDTO();
                        currentProduct.setProductId(productId);
                        currentProduct.setName(rs.getString("name"));
                        currentProduct.setCategoryId(rs.getInt("category_id"));
                        currentProduct.setPrice(rs.getDouble("price"));
                        currentProduct.setStock(rs.getInt("stock"));

                        currentProductId = productId;
                    }

                    // Add product photo if it exists
                    int photoId = rs.getInt("photo_id");
                    if (photoId != 0) {
                        String photoUrl = rs.getString("photo_url");
                        ProductPhotoDTO photo = new ProductPhotoDTO(photoId, productId, photoUrl);
                        currentProduct.addPhoto(photo);
                    }
                }

                if (currentProduct != null) {
                    products.add(currentProduct); // Add the last product
                }
            }

            // Load all categories
            String categorySql = "SELECT * FROM categories";
            try (PreparedStatement categoryStmt = connection.prepareStatement(categorySql);
                 ResultSet categoryRs = categoryStmt.executeQuery()) {

                while (categoryRs.next()) {
                    CategoryDTO category = new CategoryDTO(
                            categoryRs.getInt("category_id"),
                            categoryRs.getString("name")
                    );
                    categories.add(category);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the data as attributes for the JSP page
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/product_list.jsp").forward(request, response);
    }
}