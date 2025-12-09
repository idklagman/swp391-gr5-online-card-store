package servlets;

import dao.UserDAO;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends jakarta.servlet.http.HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/META-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        try {
            User u = userDAO.authenticate(email, pass);
            if (u != null) {
                HttpSession s = req.getSession(true);
                s.setAttribute("currentUser", u);
                resp.sendRedirect(req.getContextPath() + "/admin/products");
            } else {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("/META-INF/views/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
