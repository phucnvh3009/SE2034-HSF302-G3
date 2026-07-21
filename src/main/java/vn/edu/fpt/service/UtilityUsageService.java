package vn.edu.fpt.service;

import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.request.domstaff.UtilityUsageCreateReqDTO;
import vn.edu.fpt.dto.response.domstaff.UtilityUsageListDTO;

import java.util.List;

@Service
public interface UtilityUsageService {
    List<UtilityUsageListDTO> getAllUtilityUsages();
    void createUtilityUsage(UtilityUsageCreateReqDTO reqDTO);
}
