<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Order History</h1>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${empty orders}">
            <p>No orders yet</p>
        </c:if>
        
        <c:if test="${not empty orders}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>#${order.id}</td>
                            <td><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                            <td><fmt:formatNumber value="${order.finalPrice}" type="currency" currencySymbol="₫" /></td>
                            <td>${order.status}</td>
                            <td><a href="${pageContext.request.contextPath}/customer/orders/detail?orderId=${order.id}" class="btn btn-sm">View Details</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



