<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="login-form">
            <h2>Login</h2>
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${param.registered == 'true'}">
                <div class="alert alert-success">Registration successful! Please login.</div>
            </c:if>
            <form method="post" action="${pageContext.request.contextPath}/login">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <p><a href="${pageContext.request.contextPath}/register">Don't have an account? Register</a></p>
        </div>
    </div>
</body>
</html>



