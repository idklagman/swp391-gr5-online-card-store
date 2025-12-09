<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Top-up Confirmation - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Top-up Confirmation</h1>
        
        <div class="topup-confirm">
            <p><strong>Amount:</strong> <fmt:formatNumber value="${amount}" type="currency" currencySymbol="₫" /></p>
            <p><strong>Reference Code:</strong> ${referenceCode}</p>
            
            <div class="qr-code">
                <h3>Scan QR Code to Pay</h3>
                <img src="${qrUrl}" alt="QR Code" style="max-width: 300px;">
            </div>
            
            <p class="info">Please complete the payment. Your wallet will be updated automatically after payment confirmation.</p>
            
            <a href="${pageContext.request.contextPath}/customer/wallet" class="btn btn-primary">Back to Wallet</a>
        </div>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



