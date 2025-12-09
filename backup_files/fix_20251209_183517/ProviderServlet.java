package servlets;

import dao.ProviderDAO;
import models.Provider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/providers")
public class ProviderServlet extends jakarta.servlet.http.HttpServlet {
    private final ProviderDAO dao = new ProviderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("new".equals(action)) {
                req.getRequestDispatcher("/META-INF/views/admin/providerForm.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                Provider p = dao.findById(id);
                req.setAttribute("provider", p);
                req.getRequestDispatcher("/META-INF/views/admin/providerForm.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                Long id = Long.parseLong(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/admin/providers");
                return;
            }
            List<Provider> list = dao.findAll();
            req.setAttribute("providers", list);
            req.getRequestDispatcher("/META-INF/views/admin/providerList.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        try {
            String idStr = req.getParameter("id");
            Provider p = new Provider();
            if (idStr != null && !idStr.isEmpty()) p.setId(Long.parseLong(idStr));
            p.setName(req.getParameter("name"));
            p.setContactInfo(req.getParameter("contact_info"));
            p.setStatus(req.getParameter("status"));

            if (p.getId() == null) dao.create(p); else dao.update(p);
            resp.sendRedirect(req.getContextPath() + "/admin/providers");
        } catch (SQLException e) { throw new ServletException(e); }
    }
}
