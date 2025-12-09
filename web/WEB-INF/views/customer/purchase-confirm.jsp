<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Confirmation - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Purchase Confirmation</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <c:if test="${not empty product}">
            <div class="purchase-summary">
                <h2>${product.name}</h2>
                <p>${product.description}</p>
                
                <div class="price-details">
                    <p>Original Price: <fmt:formatNumber value="${originalPrice}" type="currency" currencySymbol="₫" /></p>
                    <c:if test="${discountPercent > 0}">
                        <p>Discount: ${discountPercent}%</p>
                    </c:if>
                    <p class="final-price"><strong>Final Price: <fmt:formatNumber value="${finalPrice}" type="currency" currencySymbol="₫" /></strong></p>
                </div>
                
                <p>Your Wallet Balance: <fmt:formatNumber value="${walletBalance}" type="currency" currencySymbol="₫" /></p>
                
                <c:if test="${walletBalance < finalPrice}">
                    <div class="alert alert-warning">
                        Insufficient wallet balance. Please <a href="${pageContext.request.contextPath}/customer/wallet/topup">top-up your wallet</a>.
                    </div>
                </c:if>
                
                <form method="post" action="${pageContext.request.contextPath}/customer/purchase">
                    <input type="hidden" name="productId" value="${product.id}">
                    <div class="form-group">
                        <label>Email to receive card code:</label>
                        <input type="email" name="receiverEmail" value="${not empty user ? user.email : ''}" required>
                    </div>
                    <button type="submit" class="btn btn-primary" ${walletBalance < finalPrice ? 'disabled' : ''}>Confirm Purchase</button>
                </form>
            </div>
        </c:if>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>

