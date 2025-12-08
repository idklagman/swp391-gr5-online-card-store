package model;

import java.util.Date;

public class Order {
    private long id;
    private long userId;
    private long cardinfoId;
    private Date createdAt;
    private double originalPrice;
    private double discountPercent;
    private double finalPrice;
    private String status;
    private String receiverEmail;

    public Order() {}

    public Order(long id, long userId, long cardinfoId, Date createdAt, double originalPrice,
                 double discountPercent, double finalPrice, String status, String receiverEmail) {

        this.id = id;
        this.userId = userId;
        this.cardinfoId = cardinfoId;
        this.createdAt = createdAt;
        this.originalPrice = originalPrice;
        this.discountPercent = discountPercent;
        this.finalPrice = finalPrice;
        this.status = status;
        this.receiverEmail = receiverEmail;
    }

    // GETTERS – SETTERS
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }

    public long getCardinfoId() { return cardinfoId; }
    public void setCardinfoId(long cardinfoId) { this.cardinfoId = cardinfoId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public double getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(double originalPrice) { this.originalPrice = originalPrice; }

    public double getDiscountPercent() { return discountPercent; }
    public void setDiscountPercent(double discountPercent) { this.discountPercent = discountPercent; }

    public double getFinalPrice() { return finalPrice; }
    public void setFinalPrice(double finalPrice) { this.finalPrice = finalPrice; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getReceiverEmail() { return receiverEmail; }
    public void setReceiverEmail(String receiverEmail) { this.receiverEmail = receiverEmail; }
}
