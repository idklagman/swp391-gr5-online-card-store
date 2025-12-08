package model;

import java.util.Date;

public class WalletTransaction {
    private long id;
    private long userId;
    private String type;     // TOPUP, PURCHASE, REFUND
    private double amount;
    private double balance;
    private String status;   // PENDING, SUCCESS, FAILED
    private String referenceCode;
    private String qrUrl;
    private String bankCode;
    private Date paymentTime;
    private Date createdAt;
    private Date updatedAt;

    public WalletTransaction() {}

    public WalletTransaction(long id, long userId, String type, double amount, double balance,
                             String status, String referenceCode, String qrUrl, String bankCode,
                             Date paymentTime, Date createdAt, Date updatedAt) {

        this.id = id;
        this.userId = userId;
        this.type = type;
        this.amount = amount;
        this.balance = balance;
        this.status = status;
        this.referenceCode = referenceCode;
        this.qrUrl = qrUrl;
        this.bankCode = bankCode;
        this.paymentTime = paymentTime;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // GETTERS – SETTERS
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public double getBalance() { return balance; }
    public void setBalance(double balance) { this.balance = balance; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getReferenceCode() { return referenceCode; }
    public void setReferenceCode(String referenceCode) { this.referenceCode = referenceCode; }

    public String getQrUrl() { return qrUrl; }
    public void setQrUrl(String qrUrl) { this.qrUrl = qrUrl; }

    public String getBankCode() { return bankCode; }
    public void setBankCode(String bankCode) { this.bankCode = bankCode; }

    public Date getPaymentTime() { return paymentTime; }
    public void setPaymentTime(Date paymentTime) { this.paymentTime = paymentTime; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
}
