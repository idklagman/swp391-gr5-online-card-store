<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Detail - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script>
        function toggleCardCode() {
            var codeElement = document.getElementById('cardCode');
            var toggleBtn = document.getElementById('toggleBtn');
            if (codeElement.style.display === 'none') {
                codeElement.style.display = 'block';
                toggleBtn.textContent = 'Hide Card Code';
            } else {
                codeElement.style.display = 'none';
                toggleBtn.textContent = 'Show Card Code';
            }
        }
    </script>
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Order Detail #${order.id}</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <c:if test="${not empty order}">
            <div class="order-detail">
                <h2>${product.name}</h2>
                <p>Order Date: <fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm" /></p>
                <p>Status: ${order.status}</p>
                
                <div class="price-info">
                    <p>Original Price: <fmt:formatNumber value="${order.originalPrice}" type="currency" currencySymbol="₫" /></p>
                    <c:if test="${order.discountPercent > 0}">
                        <p>Discount: ${order.discountPercent}%</p>
                    </c:if>
                    <p><strong>Final Price: <fmt:formatNumber value="${order.finalPrice}" type="currency" currencySymbol="₫" /></strong></p>
                </div>
                
                <c:if test="${not empty card}">
                    <div class="card-info">
                        <h3>Card Information</h3>
                        <button id="toggleBtn" onclick="toggleCardCode()" class="btn btn-sm">Show Card Code</button>
                        <div id="cardCode" style="display: none;">
                            <p><strong>Card Code:</strong> ${card.code}</p>
                            <c:if test="${not empty card.serial}">
                                <p><strong>Serial:</strong> ${card.serial}</p>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </div>
        </c:if>
        
        <a href="${pageContext.request.contextPath}/customer/orders" class="btn btn-secondary">Back to Orders</a>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



