package vn.edu.fpt.service;

import vn.edu.fpt.dto.response.StaffListResponse;
import vn.edu.fpt.dto.request.StaffCreateRequest;

import java.util.List;

public interface StaffService {
    List<StaffListResponse> getStaffsByManagerId(Long managerId);
    void createStaff(StaffCreateRequest request, Long managerId);
}
