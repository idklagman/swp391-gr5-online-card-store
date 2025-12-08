package model;

import java.util.Date;

public class User {
    private long id;
    private String email;
    private String passwordHash;
    private String fullName;
    private String phone;
    private String address;
    private String status; // ACTIVE, LOCKED, INACTIVE
    private double walletBalance;
    private long roleId;
    private Date createdAt;
    private Date updatedAt;

    public User() {}

    public User(long id, String email, String passwordHash, String fullName, String phone,
                String address, String status, double walletBalance, long roleId,
                Date createdAt, Date updatedAt) {
        this.id = id;
        this.email = email;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.walletBalance = walletBalance;
        this.roleId = roleId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // GETTERS – SETTERS
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getWalletBalance() { return walletBalance; }
    public void setWalletBalance(double walletBalance) { this.walletBalance = walletBalance; }

    public long getRoleId() { return roleId; }
    public void setRoleId(long roleId) { this.roleId = roleId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
}
