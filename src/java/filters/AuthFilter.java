package filters;

import models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter("/staff/*")
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession s = req.getSession(false);
        User u = s != null ? (User) s.getAttribute("currentUser") : null;
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        String roleName = u.getRole() != null ? u.getRole().getName() : "";
        if (!("STAFF".equalsIgnoreCase(roleName))) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }
        chain.doFilter(request, response);
    }
}