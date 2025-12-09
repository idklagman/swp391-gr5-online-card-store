<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Card Code List - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Card Code List</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <form method="get" class="filter-form">
        <div class="form-group">
            <label>Product:</label>
            <select name="productId">
                <option value="">All</option>
                <c:forEach var="p" items="${products}">
                    <option value="${p.id}" ${p.id == productId ? 'selected' : ''}>${p.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Status:</label>
            <select name="status">
                <option value="">All</option>
                <option value="AVAILABLE" ${status == 'AVAILABLE' ? 'selected' : ''}>AVAILABLE</option>
                <option value="SOLD" ${status == 'SOLD' ? 'selected' : ''}>SOLD</option>
                <option value="EXPIRED" ${status == 'EXPIRED' ? 'selected' : ''}>EXPIRED</option>
                <option value="INACTIVE" ${status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
            </select>
        </div>
        <button type="submit" class="btn btn-secondary">Filter</button>
    </form>

    <table class="table">
        <thead>
        <tr>
            <th>Product</th>
            <th>Code</th>
            <th>Serial</th>
            <th>Status</th>
            <th>Created</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cards}">
            <tr>
                <td>${c.productId}</td>
                <td>${c.code}</td>
                <td>${c.serial}</td>
                <td>${c.status}</td>
                <td><fmt:formatDate value="${c.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty cards}">
        <p>No card codes found.</p>
    </c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

