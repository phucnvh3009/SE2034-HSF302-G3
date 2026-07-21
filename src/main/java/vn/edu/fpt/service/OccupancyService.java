package vn.edu.fpt.service;

import vn.edu.fpt.dto.response.OccupancyDTO;

public interface OccupancyService {
    OccupancyDTO getOccupancyByManagerId(Long managerId);
}
