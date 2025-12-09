<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Product Detail</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <c:if test="${not empty product}">
        <div class="order-detail">
            <h2>${product.name}</h2>
            <p>${product.description}</p>
            <p>Category:
                <c:forEach var="c" items="${categories}">
                    <c:if test="${c.id == product.categoryId}">${c.name}</c:if>
                </c:forEach>
            </p>
            <p>Stock: ${product.quantity}</p>
            <p>Price:
                <fmt:formatNumber value="${product.sellPrice}" type="currency" currencySymbol="₫" />
                <c:if test="${product.discountPercent > 0}">
                    <span class="discount">-${product.discountPercent}%</span>
                </c:if>
            </p>

            <c:if test="${not empty user && roleName == 'CUSTOMER'}">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/purchase?productId=${product.id}">Buy Now</a>
            </c:if>
            <c:if test="${empty user}">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Login to Buy</a>
            </c:if>
        </div>
    </c:if>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

