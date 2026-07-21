package vn.edu.fpt.service;

import vn.edu.fpt.dto.request.ManagerRequest;
import vn.edu.fpt.dto.response.ManagerDTO;

import java.util.List;

public interface DormManagementService {
    List<ManagerDTO> getAllManagers();
    ManagerDTO getManagerById(Long id);
    ManagerDTO createManager(ManagerRequest request);
    void toggleManagerStatus(Long id);
    List<ManagerDTO> searchManagers(String keyword, Boolean status);
}
