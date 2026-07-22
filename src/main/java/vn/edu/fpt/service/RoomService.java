package vn.edu.fpt.service;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import vn.edu.fpt.dto.response.domstaff.RoomListDTO;

import java.util.List;
import vn.edu.fpt.dto.response.domstaff.RoomDetailDTO;
import vn.edu.fpt.model.constant.RoomStatus;

@Service
public interface RoomService {
    Page<RoomListDTO> getAllRooms(String keyword, RoomStatus status, int pageNo, int pageSize);
    List<RoomListDTO> getAllRooms();
    RoomDetailDTO getRoomDetailById(Long id);
}
