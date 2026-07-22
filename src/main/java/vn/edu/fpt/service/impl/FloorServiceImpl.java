package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import vn.edu.fpt.model.Floor;
import vn.edu.fpt.model.User;
import vn.edu.fpt.repository.FloorRepository;
import vn.edu.fpt.repository.UserRepository;
import vn.edu.fpt.service.FloorService;
import java.util.Collections;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FloorServiceImpl implements FloorService {

    private final FloorRepository floorRepository;
    private final UserRepository userRepository;

    @Override
    public List<Floor> getFloorsByManagerId(Long managerId) {
        User manager = userRepository.findById(managerId).orElse(null);
        if (manager == null || manager.getBuilding() == null) {
            return Collections.emptyList();
        }
        return floorRepository.findByBuilding_Id(manager.getBuilding().getId());
    }
}
