<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Customer Dashboard</h1>
        
        <div class="dashboard-stats">
            <div class="stat-card">
                <h3>Wallet Balance</h3>
                <p class="stat-value"><fmt:formatNumber value="${walletBalance}" type="currency" currencySymbol="₫" /></p>
                <a href="${pageContext.request.contextPath}/customer/wallet" class="btn btn-sm">View Wallet</a>
            </div>
        </div>
        
        <div class="dashboard-sections">
            <div class="section">
                <h2>Recent Transactions</h2>
                <c:if test="${empty recentTransactions}">
                    <p>No recent transactions</p>
                </c:if>
                <c:if test="${not empty recentTransactions}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tx" items="${recentTransactions}">
                                <tr>
                                    <td>${tx.type}</td>
                                    <td><fmt:formatNumber value="${tx.amount}" type="currency" currencySymbol="₫" /></td>
                                    <td>${tx.status}</td>
                                    <td><fmt:formatDate value="${tx.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
            
            <div class="section">
                <h2>Recent Orders</h2>
                <c:if test="${empty recentOrders}">
                    <p>No recent orders</p>
                </c:if>
                <c:if test="${not empty recentOrders}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${recentOrders}">
                                <tr>
                                    <td><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd" /></td>
                                    <td><fmt:formatNumber value="${order.finalPrice}" type="currency" currencySymbol="₫" /></td>
                                    <td>${order.status}</td>
                                    <td><a href="${pageContext.request.contextPath}/customer/orders/detail?orderId=${order.id}">View</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



