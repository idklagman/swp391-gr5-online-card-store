<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Top-up Wallet - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Top-up Wallet</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <form method="post" action="${pageContext.request.contextPath}/customer/wallet/topup" class="topup-form">
            <div class="form-group">
                <label>Amount (VND):</label>
                <input type="number" name="amount" min="10000" step="1000" required>
                <small>Minimum: 10,000 VND</small>
            </div>
            <button type="submit" class="btn btn-primary">Generate QR Code</button>
        </form>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



