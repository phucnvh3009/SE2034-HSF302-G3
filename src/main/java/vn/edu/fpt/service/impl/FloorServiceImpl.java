package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import vn.edu.fpt.model.Floor;
import vn.edu.fpt.repository.FloorRepository;
import vn.edu.fpt.service.FloorService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FloorServiceImpl implements FloorService {

    private final FloorRepository floorRepository;

    @Override
    public List<Floor> getFloorsByManagerId(Long managerId) {
        return floorRepository.findByBuilding_Manager_Id(managerId);
    }
}
