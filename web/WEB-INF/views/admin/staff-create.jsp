<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Staff - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Create Staff Account</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <form method="post" action="${pageContext.request.contextPath}/admin/staff">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required minlength="6">
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
                <label>Role:</label>
                <select name="roleId" required>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Create Staff</button>
            <a href="${pageContext.request.contextPath}/admin/staff" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



