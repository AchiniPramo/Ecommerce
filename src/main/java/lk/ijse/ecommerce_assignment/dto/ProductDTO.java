package lk.ijse.ecommerce_assignment.dto;

import lombok.*;

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
}