package dao;

import models.Product;
import utils.DBConnect;

import java.sql.*;
import java.util.*;
import java.math.BigDecimal;

public class ProductDAO {
    public List<Product> findAll() throws SQLException {
        String sql = "SELECT * FROM Product";
        try (Connection c = DBConnect.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = mapRow(rs);
                list.add(p);
            }
            return list;
        }
    }

    public Product findById(Long id) throws SQLException {
        String sql = "SELECT * FROM Product WHERE id = ?";
        try (Connection c = DBConnect.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setObject(1, id, java.sql.Types.BIGINT);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public boolean create(Product p) throws SQLException {
        String sql = "INSERT INTO Product (category_id, provider_id, name, description, cost_price, sell_price, discount_percent, quantity, status) VALUES (?,?,?,?,?,?,?,?,?)";
        try (Connection c = DBConnect.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Use setObject to avoid unboxing Long -> long (and allow null)
            ps.setObject(1, p.getCategoryId(), java.sql.Types.BIGINT);
            ps.setObject(2, p.getProviderId(), java.sql.Types.BIGINT);

            ps.setString(3, p.getName());
            ps.setString(4, p.getDescription());

            // cost/sell as BigDecimal (setBigDecimal handles null -> will throw NPE if null,
            // so setNull when null)
            if (p.getCostPrice() == null) {
                ps.setNull(5, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(5, p.getCostPrice());
            }
            if (p.getSellPrice() == null) {
                ps.setNull(6, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(6, p.getSellPrice());
            }

            // discount_percent: allow null
            if (p.getDiscountPercent() == null) {
                ps.setNull(7, java.sql.Types.DOUBLE);
            } else {
                ps.setDouble(7, p.getDiscountPercent());
            }

            // quantity: allow null
            if (p.getQuantity() == null) {
                ps.setNull(8, java.sql.Types.INTEGER);
            } else {
                ps.setInt(8, p.getQuantity());
            }

            ps.setString(9, p.getStatus() == null ? "ACTIVE" : p.getStatus());

            int aff = ps.executeUpdate();
            if (aff == 0) return false;
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) p.setId(keys.getLong(1));
            }
            return true;
        }
    }

    public boolean update(Product p) throws SQLException {
        String sql = "UPDATE Product SET category_id=?, provider_id=?, name=?, description=?, cost_price=?, sell_price=?, discount_percent=?, quantity=?, status=? WHERE id=?";
        try (Connection c = DBConnect.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            // use setObject for nullable foreign keys
            ps.setObject(1, p.getCategoryId(), java.sql.Types.BIGINT);
            ps.setObject(2, p.getProviderId(), java.sql.Types.BIGINT);

            ps.setString(3, p.getName());
            ps.setString(4, p.getDescription());

            if (p.getCostPrice() == null) {
                ps.setNull(5, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(5, p.getCostPrice());
            }
            if (p.getSellPrice() == null) {
                ps.setNull(6, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(6, p.getSellPrice());
            }

            if (p.getDiscountPercent() == null) {
                ps.setNull(7, java.sql.Types.DOUBLE);
            } else {
                ps.setDouble(7, p.getDiscountPercent());
            }

            if (p.getQuantity() == null) {
                ps.setNull(8, java.sql.Types.INTEGER);
            } else {
                ps.setInt(8, p.getQuantity());
            }

            ps.setString(9, p.getStatus() == null ? "ACTIVE" : p.getStatus());
            ps.setObject(10, p.getId(), java.sql.Types.BIGINT);

            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(Long id) throws SQLException {
        String sql = "DELETE FROM Product WHERE id = ?";
        try (Connection c = DBConnect.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setObject(1, id, java.sql.Types.BIGINT);
            return ps.executeUpdate() > 0;
        }
    }

    private Product mapRow(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setId(rs.getLong("id"));

        // Use getObject and convert to wrapper types safely
        Long catId = (Long) rs.getObject("category_id");
        p.setCategoryId(catId);

        Long provId = (Long) rs.getObject("provider_id");
        p.setProviderId(provId);

        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));

        p.setCostPrice(rs.getBigDecimal("cost_price"));
        p.setSellPrice(rs.getBigDecimal("sell_price"));

        Object dpObj = rs.getObject("discount_percent");
        p.setDiscountPercent(dpObj == null ? null : ((Number) dpObj).doubleValue());

        Object qtyObj = rs.getObject("quantity");
        p.setQuantity(qtyObj == null ? null : ((Number) qtyObj).intValue());

        p.setStatus(rs.getString("status"));
        return p;
    }
}