package vn.edu.fpt.service;

import vn.edu.fpt.model.Floor;

import java.util.List;

public interface FloorService {
    List<Floor> getFloorsByManagerId(Long managerId);
}
