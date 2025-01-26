package lk.ijse.ecommerce_assignment.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CategoryDTO {
    private int id;
    private String name;
    private String description;

    public CategoryDTO(int categoryId, String name) {
        this.id = categoryId;
        this.name = name;
    }
}
