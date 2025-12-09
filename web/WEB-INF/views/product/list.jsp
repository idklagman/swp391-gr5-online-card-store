<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Products</h1>

    <form method="get" class="filter-form">
        <div class="form-group">
            <label>Category:</label>
            <select name="categoryId">
                <option value="">All</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}" ${cat.id == selectedCategory ? 'selected' : ''}>${cat.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Keyword:</label>
            <input type="text" name="q" value="${keyword}">
        </div>
        <button type="submit" class="btn btn-secondary">Filter</button>
    </form>

    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <div class="products-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <h3>${product.name}</h3>
                <p>${product.description}</p>
                <p class="price">
                    <fmt:formatNumber value="${product.sellPrice}" type="currency" currencySymbol="₫" />
                    <c:if test="${product.discountPercent > 0}">
                        <span class="discount">-${product.discountPercent}%</span>
                    </c:if>
                </p>
                <p>Stock: ${product.quantity}</p>
                <a href="${pageContext.request.contextPath}/product/detail?id=${product.id}" class="btn btn-primary">View Detail</a>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty products}">
        <p>No products available.</p>
    </c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

