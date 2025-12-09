<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav>
        <div class="nav-brand">
            <a href="${pageContext.request.contextPath}/">Online Card Store</a>
        </div>
        <div class="nav-menu">
            <c:if test="${not empty user}">
                <span>Welcome, ${user.fullName}</span>
                <c:if test="${roleName == 'CUSTOMER'}">
                    <a href="${pageContext.request.contextPath}/customer/dashboard">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/customer/wallet">Wallet</a>
                    <a href="${pageContext.request.contextPath}/customer/orders">Orders</a>
                </c:if>
                <c:if test="${roleName == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">Admin Dashboard</a>
                </c:if>
                <c:if test="${roleName == 'STAFF'}">
                    <a href="${pageContext.request.contextPath}/staff/dashboard">Staff Dashboard</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:if>
            <c:if test="${empty user}">
                <a href="${pageContext.request.contextPath}/login">Login</a>
                <a href="${pageContext.request.contextPath}/register">Register</a>
            </c:if>
        </div>
    </nav>
</header>


