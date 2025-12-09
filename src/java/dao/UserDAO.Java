package dao;

import models.User;
import models.Role;
import utils.DBConnect;
import utils.PasswordUtil;
import java.sql.*;

public class UserDAO {
    public User authenticate(String email, String plainPassword) throws SQLException {
        String sql = "SELECT u.*, r.id AS role_id, r.name AS role_name, r.description AS role_desc FROM `User` u JOIN Role r ON u.role_id = r.id WHERE u.email = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String stored = rs.getString("password_hash");
                    if (PasswordUtil.matches(plainPassword, stored)) {
                        User u = new User();
                        u.setId(rs.getLong("id"));
                        u.setEmail(rs.getString("email"));
                        u.setFullName(rs.getString("full_name"));
                        u.setPasswordHash(stored);
                        Role role = new Role();
                        role.setId(rs.getLong("role_id"));
                        role.setName(rs.getString("role_name"));
                        role.setDescription(rs.getString("role_desc"));
                        u.setRole(role);
                        return u;
                    }
                }
            }
        }
        return null;
    }

    public User findById(long id) throws SQLException {
        String sql = "SELECT u.*, r.id AS role_id, r.name AS role_name, r.description AS role_desc FROM `User` u JOIN Role r ON u.role_id = r.id WHERE u.id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setId(rs.getLong("id"));
                    u.setEmail(rs.getString("email"));
                    u.setFullName(rs.getString("full_name"));
                    Role role = new Role();
                    role.setId(rs.getLong("role_id"));
                    role.setName(rs.getString("role_name"));
                    u.setRole(role);
                    return u;
                }
            }
        }
        return null;
    }
}