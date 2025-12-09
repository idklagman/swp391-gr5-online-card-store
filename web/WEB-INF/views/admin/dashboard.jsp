<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <div class="dashboard-stats">
            <div class="stat-card">
                <h3>Total Customers</h3>
                <p class="stat-value">${stats.totalCustomers}</p>
            </div>
            <div class="stat-card">
                <h3>Transactions Today</h3>
                <p class="stat-value">${stats.transactionsToday}</p>
            </div>
            <div class="stat-card">
                <h3>Revenue Today</h3>
                <p class="stat-value"><fmt:formatNumber value="${stats.revenueToday}" type="currency" currencySymbol="₫" /></p>
            </div>
            <div class="stat-card">
                <h3>Inventory Remaining</h3>
                <p class="stat-value">${stats.inventoryRemaining}</p>
            </div>
        </div>
        
        <div class="admin-menu">
            <h2>Management</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/staff">Manage Staff Accounts</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/customers">Manage Customer Accounts</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/roles">Manage Roles & Permissions</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/config">System Configuration</a></li>
            </ul>
        </div>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



