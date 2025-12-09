<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Revenue Reports - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Revenue Reports</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <div class="stat-card">
        <h3>Revenue Today</h3>
        <p class="stat-value"><fmt:formatNumber value="${revenueToday}" type="currency" currencySymbol="₫" /></p>
    </div>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

