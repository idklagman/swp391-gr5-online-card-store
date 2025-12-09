package dao;

import models.Role;
import utils.DBConnect;
import java.sql.*;

public class RoleDAO {
    public Role findById(long id) throws SQLException {
        String sql = "SELECT * FROM Role WHERE id = ?";
        try (Connection c = DBConnect.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Role r = new Role();
                    r.setId(rs.getLong("id"));
                    r.setName(rs.getString("name"));
                    r.setDescription(rs.getString("description"));
                    return r;
                }
            }
        }
        return null;
    }
}