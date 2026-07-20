package vn.edu.fpt.dto.request;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserRequest {

    private String fullName;
    private String email;
    private String password;

}
