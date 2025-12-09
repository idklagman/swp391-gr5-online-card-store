package dao;

import models.Category;
import utils.DBConnect;
import java.sql.*;
import java.util.*;

public class CategoryDAO {
    public List<Category> findAll() throws SQLException {
        String sql = "SELECT * FROM Category";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getLong("id"));
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                cat.setStatus(rs.getString("status"));
                list.add(cat);
            }
            return list;
        }
    }

    public Category findById(Long id) throws SQLException {
        String sql = "SELECT * FROM Category WHERE id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Category cat = new Category();
                    cat.setId(rs.getLong("id"));
                    cat.setName(rs.getString("name"));
                    cat.setDescription(rs.getString("description"));
                    cat.setStatus(rs.getString("status"));
                    return cat;
                }
            }
        }
        return null;
    }

    public boolean create(Category cat) throws SQLException {
        String sql = "INSERT INTO Category (name, description, status) VALUES (?,?,?)";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getDescription());
            ps.setString(3, cat.getStatus() == null ? "ACTIVE" : cat.getStatus());
            int aff = ps.executeUpdate();
            if (aff == 0) return false;
            try (ResultSet keys = ps.getGeneratedKeys()) { if (keys.next()) cat.setId(keys.getLong(1)); }
            return true;
        }
    }

    public boolean update(Category cat) throws SQLException {
        String sql = "UPDATE Category SET name=?, description=?, status=? WHERE id=?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getDescription());
            ps.setString(3, cat.getStatus());
            ps.setLong(4, cat.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(Long id) throws SQLException {
        String sql = "DELETE FROM Category WHERE id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}
