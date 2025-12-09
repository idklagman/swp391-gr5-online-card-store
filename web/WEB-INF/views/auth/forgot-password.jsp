<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <div class="login-form">
        <h2>Forgot Password</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/forgot-password">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Send Temporary Password</button>
        </form>
        <p><a href="${pageContext.request.contextPath}/login">Back to Login</a></p>
    </div>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

