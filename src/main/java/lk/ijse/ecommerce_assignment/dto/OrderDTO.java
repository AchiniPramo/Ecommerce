package lk.ijse.ecommerce_assignment.dto;

import lombok.*;

import java.math.BigDecimal;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class OrderDTO {
    private int orderId;
    private String customerName;
    private BigDecimal totalPrice;
    private String orderStatus;
    private Timestamp createdAt;
}