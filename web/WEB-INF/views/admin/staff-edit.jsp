<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Staff - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Edit Staff Account</h1>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <c:if test="${not empty staff}">
            <form method="post" action="${pageContext.request.contextPath}/admin/staff/update/${staff.id}">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" value="${staff.email}" disabled>
                    <small>Email cannot be changed</small>
                </div>
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="fullName" value="${staff.fullName}" required>
                </div>
                <div class="form-group">
                    <label>Phone:</label>
                    <input type="text" name="phone" value="${staff.phone}">
                </div>
                <div class="form-group">
                    <label>Role:</label>
                    <select name="roleId" required>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.id}" ${staff.roleId == role.id ? 'selected' : ''}>${role.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>New Password (leave blank to keep current):</label>
                    <input type="password" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Update Staff</button>
                <a href="${pageContext.request.contextPath}/admin/staff" class="btn btn-secondary">Cancel</a>
            </form>
        </c:if>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



