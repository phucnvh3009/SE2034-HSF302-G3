package vn.edu.fpt.service;

import vn.edu.fpt.dto.request.UserRequest;
import vn.edu.fpt.model.User;
import vn.edu.fpt.repository.UserRepository;

public interface AuthManagerService {

    User authenticate(String username, String password);

    User register(UserRequest userRequest);
}
