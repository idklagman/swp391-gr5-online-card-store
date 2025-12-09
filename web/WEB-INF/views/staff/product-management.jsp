<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Product Management</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success">Saved successfully</div>
    </c:if>

    <div class="inline-form">
        <form method="post" action="${pageContext.request.contextPath}/staff/products">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="description">
            </div>
            <div class="form-group">
                <label>Category:</label>
                <select name="categoryId" required>
                    <c:forEach var="c" items="${categories}">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Provider:</label>
                <select name="providerId" required>
                    <c:forEach var="p" items="${providers}">
                        <option value="${p.id}">${p.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Cost Price:</label>
                <input type="number" step="0.01" name="costPrice" required>
            </div>
            <div class="form-group">
                <label>Sell Price:</label>
                <input type="number" step="0.01" name="sellPrice" required>
            </div>
            <div class="form-group">
                <label>Discount %:</label>
                <input type="number" step="0.01" name="discountPercent" value="0">
            </div>
            <div class="form-group">
                <label>Quantity:</label>
                <input type="number" name="quantity" required>
            </div>
            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <option value="ACTIVE">ACTIVE</option>
                    <option value="INACTIVE">INACTIVE</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.name}</td>
                <td>${p.categoryId}</td>
                <td>${p.sellPrice}</td>
                <td>${p.quantity}</td>
                <td>${p.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

