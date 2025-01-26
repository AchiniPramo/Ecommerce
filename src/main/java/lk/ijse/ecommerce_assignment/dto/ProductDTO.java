package lk.ijse.ecommerce_assignment.dto;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProductDTO {
    private int productId;
    private String name;
    private int categoryId;
    private double price;
    private int stock;
    private List<ProductPhotoDTO> photos = new ArrayList<>();

    public ProductDTO(int productId, String name, int categoryId, double price, int stock) {
        this.productId = productId;
        this.name = name;
        this.categoryId = categoryId;
        this.price = price;
        this.stock = stock;
    }

    public void addPhoto(ProductPhotoDTO photo) {
        this.photos.add(photo);
    }
}