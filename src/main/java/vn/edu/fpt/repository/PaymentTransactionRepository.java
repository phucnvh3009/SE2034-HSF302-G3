package vn.edu.fpt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.edu.fpt.model.PaymentTransaction;

import java.util.List;

@Repository
public interface PaymentTransactionRepository extends JpaRepository<PaymentTransaction, Long> {

    // Tìm lịch sử giao dịch thanh toán của hóa đơn
    List<PaymentTransaction> findByBillId(Long billId);
}
