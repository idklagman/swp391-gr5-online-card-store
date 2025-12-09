<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="register-form">
            <h2>Register</h2>
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <form method="post" action="${pageContext.request.contextPath}/register">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required minlength="6">
                </div>
                <div class="form-group">
                    <label>Confirm Password:</label>
                    <input type="password" name="confirmPassword" required minlength="6">
                </div>
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="fullName" required>
                </div>
                <div class="form-group">
                    <label>Phone:</label>
                    <input type="text" name="phone">
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" name="address">
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
            <p><a href="${pageContext.request.contextPath}/login">Already have an account? Login</a></p>
        </div>
    </div>
</body>
</html>



