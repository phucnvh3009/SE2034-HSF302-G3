package vn.edu.fpt.controller.domstaff;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.dto.response.domstaff.ReportDetailDTO;
import vn.edu.fpt.model.constant.ReportStatus;
import vn.edu.fpt.service.IssueReportService;

@Controller
@RequestMapping("/domstaff")
@AllArgsConstructor
public class ListReportController {
    private IssueReportService issueReportService;

    @RequestMapping("/reports")
    public String list(Model model){
        model.addAttribute("reports", issueReportService.getAllIssueReports());
        return "views/domstaff/student/StudentRequestList";
    }
    @GetMapping("/requests/detail/{id}")
    public String viewRequestDetail(@PathVariable("id") Long id, Model model) {
        ReportDetailDTO report = issueReportService.getIssueReportById(id);
        model.addAttribute("report", report);

        return "views/domstaff/student/RequestDetail";
    }
    @PostMapping("/requests/detail/{id}")
    public String updateRequest(@PathVariable("id") Long id,
                                @RequestParam("staffNote") String staffNote,
                                @RequestParam("status") ReportStatus status) {
        issueReportService.updateReportStatusAndNote(id, status, staffNote);
        return "redirect:/domstaff/reports";
    }


}
