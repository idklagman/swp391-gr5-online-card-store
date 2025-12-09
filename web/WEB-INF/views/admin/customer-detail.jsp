<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Detail - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Customer Detail</h1>
        
        <c:if test="${not empty customer}">
            <div class="customer-detail">
                <h2>${customer.fullName}</h2>
                <p><strong>Email:</strong> ${customer.email}</p>
                <p><strong>Phone:</strong> ${customer.phone}</p>
                <p><strong>Address:</strong> ${customer.address}</p>
                <p><strong>Status:</strong> ${customer.status}</p>
                <p><strong>Wallet Balance:</strong> <fmt:formatNumber value="${customer.walletBalance}" type="currency" currencySymbol="₫" /></p>
                <p><strong>Created:</strong> <fmt:formatDate value="${customer.createdAt}" pattern="yyyy-MM-dd HH:mm" /></p>
            </div>
            
            <form method="post" action="${pageContext.request.contextPath}/admin/customers/toggle/${customer.id}">
                <button type="submit" class="btn btn-primary">Toggle Status (Block/Unblock)</button>
            </form>
        </c:if>
        
        <a href="${pageContext.request.contextPath}/admin/customers" class="btn btn-secondary">Back to Customers</a>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



