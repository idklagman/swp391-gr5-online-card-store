<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orders Management - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Orders Management</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <c:if test="${param.resend == 'success'}">
        <div class="alert alert-success">Card code resent</div>
    </c:if>

    <form method="get" class="filter-form">
        <div class="form-group">
            <label>Status:</label>
            <select name="status">
                <option value="">All</option>
                <option value="PENDING" ${status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                <option value="PAID" ${status == 'PAID' ? 'selected' : ''}>PAID</option>
                <option value="COMPLETED" ${status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                <option value="CANCELED" ${status == 'CANCELED' ? 'selected' : ''}>CANCELED</option>
                <option value="REFUNDED" ${status == 'REFUNDED' ? 'selected' : ''}>REFUNDED</option>
            </select>
        </div>
        <button type="submit" class="btn btn-secondary">Filter</button>
    </form>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Price</th>
            <th>Status</th>
            <th>Created</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td>${o.id}</td>
                <td>${o.userId}</td>
                <td><fmt:formatNumber value="${o.finalPrice}" type="currency" currencySymbol="₫" /></td>
                <td>${o.status}</td>
                <td><fmt:formatDate value="${o.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/staff/resend-card" style="display:inline;">
                        <input type="hidden" name="orderId" value="${o.id}">
                        <button type="submit" class="btn btn-sm">Resend Card</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty orders}">
        <p>No orders found.</p>
    </c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

