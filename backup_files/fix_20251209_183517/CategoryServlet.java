package servlets;

import dao.CategoryDAO;
import models.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/categories")
public class CategoryServlet extends jakarta.servlet.http.HttpServlet {
    private final CategoryDAO dao = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("new".equals(action)) {
                req.getRequestDispatcher("/META-INF/views/admin/categoryForm.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                Category c = dao.findById(id);
                req.setAttribute("category", c);
                req.getRequestDispatcher("/META-INF/views/admin/categoryForm.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                return;
            }
            List<Category> list = dao.findAll();
            req.setAttribute("categories", list);
            req.getRequestDispatcher("/META-INF/views/admin/categoryList.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            String idStr = req.getParameter("id");
            Category c = new Category();
            if (idStr != null && !idStr.isEmpty()) c.setId(Long.parseLong(idStr));
            c.setName(req.getParameter("name"));
            c.setDescription(req.getParameter("description"));
            c.setStatus(req.getParameter("status"));

            if (c.getId() == null) dao.create(c); else dao.update(c);
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
        } catch (SQLException e) { throw new ServletException(e); }
    }
}
