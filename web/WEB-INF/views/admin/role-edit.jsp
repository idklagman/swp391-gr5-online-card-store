<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Role - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Edit Role</h1>
        
        <c:if test="${not empty role}">
            <form method="post" action="${pageContext.request.contextPath}/admin/roles/update/${role.id}">
                <div class="form-group">
                    <label>Role Name:</label>
                    <input type="text" name="name" value="${role.name}" required>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" name="description" value="${role.description}">
                </div>
                <button type="submit" class="btn btn-primary">Update Role</button>
                <a href="${pageContext.request.contextPath}/admin/roles" class="btn btn-secondary">Cancel</a>
            </form>
        </c:if>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



