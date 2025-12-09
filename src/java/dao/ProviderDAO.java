package dao;

import models.Provider;
import utils.DBConnect;
import java.sql.*;
import java.util.*;

public class ProviderDAO {
    public List<Provider> findAll() throws SQLException {
        String sql = "SELECT * FROM Provider";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<Provider> list = new ArrayList<>();
            while (rs.next()) {
                Provider p = new Provider();
                p.setId(rs.getLong("id"));
                p.setName(rs.getString("name"));
                p.setContactInfo(rs.getString("contact_info"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
            return list;
        }
    }

    public Provider findById(Long id) throws SQLException {
        String sql = "SELECT * FROM Provider WHERE id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Provider p = new Provider();
                    p.setId(rs.getLong("id"));
                    p.setName(rs.getString("name"));
                    p.setContactInfo(rs.getString("contact_info"));
                    p.setStatus(rs.getString("status"));
                    return p;
                }
            }
        }
        return null;
    }

    public boolean create(Provider provider) throws SQLException {
        String sql = "INSERT INTO Provider (name, contact_info, status) VALUES (?,?,?)";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, provider.getName());
            ps.setString(2, provider.getContactInfo());
            ps.setString(3, provider.getStatus() == null ? "ACTIVE" : provider.getStatus());
            int aff = ps.executeUpdate();
            if (aff == 0) return false;
            try (ResultSet keys = ps.getGeneratedKeys()) { if (keys.next()) provider.setId(keys.getLong(1)); }
            return true;
        }
    }

    public boolean update(Provider provider) throws SQLException {
        String sql = "UPDATE Provider SET name=?, contact_info=?, status=? WHERE id=?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, provider.getName());
            ps.setString(2, provider.getContactInfo());
            ps.setString(3, provider.getStatus());
            ps.setLong(4, provider.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(Long id) throws SQLException {
        String sql = "DELETE FROM Provider WHERE id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}