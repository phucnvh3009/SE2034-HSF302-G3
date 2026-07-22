package vn.edu.fpt.service;

import vn.edu.fpt.dto.request.StaffRequest;
import vn.edu.fpt.dto.response.StaffDTO;

import java.util.List;

public interface DormStaffService {
    List<StaffDTO> getAllStaffsByBuildingId(Long buildingId, String keyword, Boolean status);
    StaffDTO getStaffById(Long id);
    StaffDTO createStaff(Long managerId, StaffRequest request);
    void toggleStaffStatus(Long id);
}
