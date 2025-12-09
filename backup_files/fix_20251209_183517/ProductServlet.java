package servlets;

import dao.ProductDAO;
import models.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/products")
public class ProductServlet extends jakarta.servlet.http.HttpServlet {
    private final ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("new".equals(action)) {
                req.getRequestDispatcher("/META-INF/views/admin/productForm.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                Product p = dao.findById(id);
                req.setAttribute("product", p);
                req.getRequestDispatcher("/META-INF/views/admin/productForm.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/products");
                return;
            }
            List<Product> list = dao.findAll();
            req.setAttribute("products", list);
            req.getRequestDispatcher("/META-INF/views/admin/productList.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            String idStr = req.getParameter("id");
            Product p = new Product();
            if (idStr != null && !idStr.isEmpty()) p.setId(Long.parseLong(idStr));
            p.setCategoryId(parseLong(req.getParameter("category_id")));
            p.setProviderId(parseLong(req.getParameter("provider_id")));
            p.setName(req.getParameter("name"));
            p.setDescription(req.getParameter("description"));
            p.setCostPrice(parseBigDecimal(req.getParameter("cost_price")));
            p.setSellPrice(parseBigDecimal(req.getParameter("sell_price")));
            p.setDiscountPercent(parseDouble(req.getParameter("discount_percent")));
            p.setQuantity(parseInt(req.getParameter("quantity")));
            p.setStatus(req.getParameter("status"));

            if (p.getId() == null) dao.create(p); else dao.update(p);
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private Long parseLong(String s) { try { return s == null || s.isEmpty() ? null : Long.parseLong(s); } catch (Exception e) { return null; } }
    private Integer parseInt(String s) { try { return s == null || s.isEmpty() ? null : Integer.parseInt(s); } catch (Exception e) { return null; } }
    private Double parseDouble(String s) { try { return s == null || s.isEmpty() ? null : Double.parseDouble(s); } catch (Exception e) { return null; } }
    private BigDecimal parseBigDecimal(String s) { try { return s == null || s.isEmpty() ? null : new BigDecimal(s); } catch (Exception e) { return null; } }
}
