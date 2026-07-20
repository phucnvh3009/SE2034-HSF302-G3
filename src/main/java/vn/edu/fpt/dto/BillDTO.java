package vn.edu.fpt.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BillDTO {

    private Long id;
    private String billCode;
    private String billType;       // ROOM_BILL, UTILITY_BILL, PUNISH_BILL
    private String billTypeName;   // "Tiền phòng", "Điện nước", "Phạt vi phạm"
    private BigDecimal amount;
    private String status;         // UNPAID, PAID, OVERDUE
    private String issueDate;      // dd/MM/yyyy
    private String paymentDeadline; // dd/MM/yyyy
    private String description;
    private String semesterName;
}
