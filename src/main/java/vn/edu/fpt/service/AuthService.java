package vn.edu.fpt.service;

import vn.edu.fpt.dto.request.LoginRequest;
import vn.edu.fpt.model.User;

public interface AuthService {
    User authenticate(LoginRequest request);
}
