package model;

import java.util.Date;

public class CardInfo {
    private long id;
    private long productId;
    private String code;
    private String serial;
    private Date expiryDate;
    private String status;
    private Date createdAt;
    private Date updatedAt;

    public CardInfo() {}

    public CardInfo(long id, long productId, String code, String serial,
                    Date expiryDate, String status, Date createdAt, Date updatedAt) {
        this.id = id;
        this.productId = productId;
        this.code = code;
        this.serial = serial;
        this.expiryDate = expiryDate;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // GETTERS – SETTERS
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public long getProductId() { return productId; }
    public void setProductId(long productId) { this.productId = productId; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getSerial() { return serial; }
    public void setSerial(String serial) { this.serial = serial; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
}
