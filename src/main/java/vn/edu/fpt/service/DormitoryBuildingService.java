package vn.edu.fpt.service;

import vn.edu.fpt.dto.response.BuildingDTO;
import java.util.List;

public interface DormitoryBuildingService {

    List<BuildingDTO> getActiveBuildings();
    List<BuildingDTO> getAllBuildings();

}