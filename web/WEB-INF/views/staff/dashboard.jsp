<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Staff Dashboard</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <div class="dashboard-stats">
        <div class="stat-card"><h3>Products</h3><p class="stat-value">${totalProducts}</p></div>
        <div class="stat-card"><h3>Categories</h3><p class="stat-value">${totalCategories}</p></div>
        <div class="stat-card"><h3>Orders</h3><p class="stat-value">${totalOrders}</p></div>
        <div class="stat-card"><h3>Inventory Available</h3><p class="stat-value">${inventoryRemaining}</p></div>
        <div class="stat-card"><h3>Revenue Today</h3><p class="stat-value"><fmt:formatNumber value="${revenueToday}" type="currency" currencySymbol="₫" /></p></div>
    </div>
    <div class="admin-menu">
        <h2>Quick Links</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/staff/categories">Category Management</a></li>
            <li><a href="${pageContext.request.contextPath}/staff/products">Product Management</a></li>
            <li><a href="${pageContext.request.contextPath}/staff/cardcodes/import">Import Card Codes</a></li>
            <li><a href="${pageContext.request.contextPath}/staff/cardcodes/list">Card Code List</a></li>
            <li><a href="${pageContext.request.contextPath}/staff/orders">Orders Management</a></li>
            <li><a href="${pageContext.request.contextPath}/staff/revenue">Revenue Reports</a></li>
        </ul>
    </div>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

