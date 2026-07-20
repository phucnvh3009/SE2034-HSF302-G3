package vn.edu.fpt.controller.domstaff;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.edu.fpt.dto.response.domstaff.RoomDetailDTO;
import vn.edu.fpt.dto.response.domstaff.RoomListDTO;
import vn.edu.fpt.model.constant.ReportStatus;
import vn.edu.fpt.model.constant.RoomStatus;
import vn.edu.fpt.service.RoomService;

import java.util.List;

@Controller
@RequestMapping("/domstaff")
@AllArgsConstructor
public class ListRoomController {
    private RoomService roomService;
    @GetMapping("/rooms")
    public String listRooms(@RequestParam(value = "keyword", defaultValue = "") String keyword,
                            @RequestParam(value = "status", required = false) RoomStatus status,
                            @RequestParam(value = "page", defaultValue = "1") int page,
                            Model model) {
        Page<RoomListDTO> roomPage = roomService.getAllRooms(keyword, status, page, 10);
        model.addAttribute("rooms", roomPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", roomPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("selectedStatus", status);
        return "domstaff/room/RoomList";
    }

    @GetMapping("/rooms/detail/{id}")
    public String viewRoomDetail(@PathVariable("id") Long id, Model model) {
       RoomDetailDTO roomDetail = roomService.getRoomDetailById(id);
        model.addAttribute("roomDetail", roomDetail);
        
        return "domstaff/room/RoomDetail";
    }
}
