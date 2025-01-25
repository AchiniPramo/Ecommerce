package lk.ijse.ecommerce_assignment;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommerce_assignment.dto.CategoryDTO;
import lk.ijse.ecommerce_assignment.dto.ProductDTO;
import lk.ijse.ecommerce_assignment.dto.ProductPhotoDTO;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductManagementServlet", value = "/product-manage")
@MultipartConfig
public class ProductManagementServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            List<CategoryDTO> categories = getCategories();
            request.setAttribute("categories", categories);

            if ("edit".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("id"));
                ProductDTO product = getProductById(productId);
                List<ProductPhotoDTO> productPhotos = getProductPhotos(productId);
                request.setAttribute("product", product);
                request.setAttribute("productPhotos", productPhotos);
                request.getRequestDispatcher("product_management.jsp").forward(request, response);
                return;
            }

            List<ProductDTO> products = getAllProducts();
            List<ProductPhotoDTO> productPhotos = getAllProductPhotos();
            request.setAttribute("products", products);
            request.setAttribute("productPhotos", productPhotos);

            request.getRequestDispatcher("product_management.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addProductWithPhotos(request);
                    setMessage(request, "Product added successfully!", "success");
                    break;
                case "edit":
                    updateProductWithPhotos(request);
                    setMessage(request, "Product updated successfully!", "success");
                    break;
                case "delete":
                    deleteProduct(request);
                    setMessage(request, "Product deleted successfully!", "success");
                    break;
                default:
                    request.setAttribute("alert", "Action not recognized.");
            }
            response.sendRedirect(request.getContextPath() + "/product-manage");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("alert", "Database error occurred!");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }


    private void addProductWithPhotos(HttpServletRequest request) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        String insertProductSQL = "INSERT INTO product (name, category_id, price, stock) VALUES (?, ?, ?, ?)";
        String insertPhotoSQL = "INSERT INTO product_photos (product_id, photo_url) VALUES (?, ?)";

        try (Connection conn = dataSource.getConnection(); PreparedStatement productStmt = conn.prepareStatement(insertProductSQL, Statement.RETURN_GENERATED_KEYS)) {

            productStmt.setString(1, name);
            productStmt.setInt(2, categoryId);
            productStmt.setDouble(3, price);
            productStmt.setInt(4, stock);
            productStmt.executeUpdate();

            ResultSet generatedKeys = productStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int productId = generatedKeys.getInt(1);

                try (PreparedStatement photoStmt = conn.prepareStatement(insertPhotoSQL)) {
                    int photoCount = 0;
                    for (Part filePart : request.getParts()) {
                        if (filePart.getName().equals("photos") && filePart.getSize() > 0) {
                            if (photoCount >= 5) {
                                // Stop uploading after 5 photos
                                break;
                            }

                            String fileName = extractFileName(filePart);
                            String uploadPath = saveFile(filePart, fileName);
                            photoStmt.setInt(1, productId);
                            photoStmt.setString(2, uploadPath);
                            photoStmt.executeUpdate();
                            photoCount++;
                        }
                    }
                }
            }
        }
    }

    private void updateProductWithPhotos(HttpServletRequest request) throws SQLException, IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        String updateProductSQL = "UPDATE product SET name = ?, category_id = ?, price = ?, stock = ? WHERE product_id = ?";
        String insertPhotoSQL = "INSERT INTO product_photos (product_id, photo_url) VALUES (?, ?)";

        try (Connection conn = dataSource.getConnection(); PreparedStatement productStmt = conn.prepareStatement(updateProductSQL)) {

            // Update product
            productStmt.setString(1, name);
            productStmt.setInt(2, categoryId);
            productStmt.setDouble(3, price);
            productStmt.setInt(4, stock);
            productStmt.setInt(5, productId);
            productStmt.executeUpdate();

            // Optionally update photos (limit to 5 photos)
            try (PreparedStatement photoStmt = conn.prepareStatement(insertPhotoSQL)) {
                int photoCount = 0;
                for (Part filePart : request.getParts()) {
                    if (filePart.getName().equals("photos") && filePart.getSize() > 0) {
                        if (photoCount >= 5) {
                            // Stop uploading after 5 photos
                            break;
                        }

                        String fileName = extractFileName(filePart);
                        String uploadPath = saveFile(filePart, fileName);
                        photoStmt.setInt(1, productId);
                        photoStmt.setString(2, uploadPath);
                        photoStmt.executeUpdate();
                        photoCount++;
                    }
                }
            }
        }
    }

    /**
     * Deletes a product and its associated photos.
     */
    private void deleteProduct(HttpServletRequest request) throws SQLException {
        int productId = Integer.parseInt(request.getParameter("id"));

        String deletePhotosSQL = "DELETE FROM product_photos WHERE product_id = ?";
        String deleteProductSQL = "DELETE FROM product WHERE product_id = ?";

        try (Connection conn = dataSource.getConnection()) {
            try (PreparedStatement photoStmt = conn.prepareStatement(deletePhotosSQL)) {
                photoStmt.setInt(1, productId);
                photoStmt.executeUpdate();
            }
            try (PreparedStatement productStmt = conn.prepareStatement(deleteProductSQL)) {
                productStmt.setInt(1, productId);
                productStmt.executeUpdate();
            }
        }
    }

    /**
     * Extracts the file name from the file part.
     */
    private String extractFileName(Part filePart) {
        String contentDisposition = filePart.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    /**
     * Saves the file and returns the path.
     */
    private String saveFile(Part filePart, String fileName) throws IOException {
        String uploadDir = "/uploads"; // Change this path as needed
        String uploadPath = getServletContext().getRealPath(uploadDir);

        File uploadFolder = new File(uploadPath);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        return uploadDir + "/" + fileName;
    }

    private List<CategoryDTO> getCategories() throws SQLException {
        List<CategoryDTO> categories = new ArrayList<>();
        String sql = "SELECT category_id, name, description FROM categories";

        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("category_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                categories.add(new CategoryDTO(id, name, description));
            }
        }
        return categories;
    }

    private List<ProductDTO> getAllProducts() throws SQLException {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "SELECT product_id, name, category_id, price, stock FROM product";

        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String name = rs.getString("name");
                int categoryId = rs.getInt("category_id");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                products.add(new ProductDTO(productId, name, categoryId, price, stock));
            }
        }
        return products;
    }

    private List<ProductPhotoDTO> getAllProductPhotos() throws SQLException {
        List<ProductPhotoDTO> photos = new ArrayList<>();
        String sql = "SELECT photo_id, product_id, photo_url FROM product_photos";

        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int photoId = rs.getInt("photo_id");
                int productId = rs.getInt("product_id");
                String photoUrl = rs.getString("photo_url");
                photos.add(new ProductPhotoDTO(photoId, productId, photoUrl));
            }
        }
        return photos;
    }

    private ProductDTO getProductById(int productId) throws SQLException {
        String sql = "SELECT product_id, name, category_id, price, stock FROM product WHERE product_id = ?";
        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    int categoryId = rs.getInt("category_id");
                    double price = rs.getDouble("price");
                    int stock = rs.getInt("stock");
                    return new ProductDTO(productId, name, categoryId, price, stock);
                }
            }
        }
        return null;
    }

    private List<ProductPhotoDTO> getProductPhotos(int productId) throws SQLException {
        List<ProductPhotoDTO> photos = new ArrayList<>();
        String sql = "SELECT photo_id, product_id, photo_url FROM product_photos WHERE product_id = ?";

        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int photoId = rs.getInt("photo_id");
                    String photoUrl = rs.getString("photo_url");
                    photos.add(new ProductPhotoDTO(photoId, productId, photoUrl));
                }
            }
        }
        return photos;
    }

    private void setMessage(HttpServletRequest request, String message, String type) {
        request.getSession().setAttribute("message", message);
        request.getSession().setAttribute("messageType", type);
    }
}
