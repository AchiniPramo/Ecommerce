package lk.ijse.ecommerce_assignment.dto;

import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int userId;
    private String username;
    private String email;
    private String password;
    private String role;
    private String status;

    public UserDTO(int userId, String userName, String email) {
    }

    public static UserDTO randomUserId() {
        return randomUserId();
    }
}