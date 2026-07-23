package vn.edu.fpt.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.edu.fpt.dto.response.BuildingDTO;
import vn.edu.fpt.model.DormitoryBuilding;
import vn.edu.fpt.model.constant.CommonStatus;
import vn.edu.fpt.repository.DormitoryBuildingRepository;
import vn.edu.fpt.service.DormitoryBuildingService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class DormitoryBuildingServiceImpl implements DormitoryBuildingService {

    private final DormitoryBuildingRepository dormitoryBuildingRepository;

    @Override
    @Transactional(readOnly = true)
    public List<BuildingDTO> getActiveBuildings() {

        return dormitoryBuildingRepository.findAll().stream()
                .filter(b -> b.getStatus() == CommonStatus.ACTIVE)
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional(readOnly = true)
    public List<BuildingDTO> getAllBuildings() {

        return dormitoryBuildingRepository.findAll().stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    private BuildingDTO mapToDTO(DormitoryBuilding building) {
        BuildingDTO dto = new BuildingDTO();
        dto.setId(building.getId());
        dto.setName(building.getName());
        dto.setGenderType(building.getGenderType() != null ? building.getGenderType().name() : null);
        dto.setStatus(building.getStatus() != null ? building.getStatus().name() : null);

        return dto;
    }
}