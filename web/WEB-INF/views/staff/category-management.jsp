<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Category Management - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Category Management</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success">Saved successfully</div>
    </c:if>

    <div class="inline-form">
        <form method="post" action="${pageContext.request.contextPath}/staff/categories">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="description">
            </div>
            <div class="form-group">
                <label>Status:</label>
                <select name="status">
                    <option value="ACTIVE">ACTIVE</option>
                    <option value="INACTIVE">INACTIVE</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Category</button>
        </form>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cat" items="${categories}">
            <tr>
                <td>${cat.name}</td>
                <td>${cat.description}</td>
                <td>${cat.status}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/staff/categories" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="${cat.id}">
                        <input type="hidden" name="name" value="${cat.name}">
                        <input type="hidden" name="description" value="${cat.description}">
                        <input type="hidden" name="status" value="${cat.status == 'ACTIVE' ? 'INACTIVE' : 'ACTIVE'}">
                        <button type="submit" class="btn btn-sm">Toggle Status</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

