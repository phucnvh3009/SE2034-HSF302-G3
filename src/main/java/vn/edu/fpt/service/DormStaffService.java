package vn.edu.fpt.service;

import vn.edu.fpt.dto.request.StaffRequest;
import vn.edu.fpt.dto.response.StaffDTO;

import java.util.List;

public interface DormStaffService {
    List<StaffDTO> getAllStaffs(String keyword, Boolean status);
    StaffDTO getStaffById(Long id);
    StaffDTO createStaff(StaffRequest request);
    void toggleStaffStatus(Long id);
}
