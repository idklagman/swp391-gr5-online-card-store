<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Roles - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Manage Roles & Permissions</h1>
        
        <c:if test="${param.success == 'created'}">
            <div class="alert alert-success">Role created successfully!</div>
        </c:if>
        <c:if test="${param.success == 'updated'}">
            <div class="alert alert-success">Role updated successfully!</div>
        </c:if>
        
        <h2>Create New Role</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin/roles" class="inline-form">
            <div class="form-group">
                <label>Role Name:</label>
                <input type="text" name="name" required>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="description">
            </div>
            <button type="submit" class="btn btn-primary">Create Role</button>
        </form>
        
        <h2>Existing Roles</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="role" items="${roles}">
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.name}</td>
                        <td>${role.description}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/roles/edit/${role.id}" class="btn btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



