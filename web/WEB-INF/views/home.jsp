<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="fragments/header.jsp" />
    
    <div class="container">
        <h1>Welcome to Online Card Store</h1>
        
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
                    <c:if test="${not empty user && roleName == 'CUSTOMER'}">
                        <a href="${pageContext.request.contextPath}/customer/purchase?productId=${product.id}" class="btn btn-primary">Buy Now</a>
                    </c:if>
                    <c:if test="${empty user}">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Login to Buy</a>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${empty products}">
            <p>No products available at the moment.</p>
        </c:if>
    </div>
    
    <jsp:include page="fragments/footer.jsp" />
</body>
</html>



