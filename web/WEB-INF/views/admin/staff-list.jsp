<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Manage Staff Accounts</h1>
        
        <c:if test="${param.success == 'created'}">
            <div class="alert alert-success">Staff account created successfully!</div>
        </c:if>
        <c:if test="${param.success == 'updated'}">
            <div class="alert alert-success">Staff account updated successfully!</div>
        </c:if>
        <c:if test="${param.success == 'toggled'}">
            <div class="alert alert-success">Staff status updated!</div>
        </c:if>
        
        <a href="${pageContext.request.contextPath}/admin/staff/create" class="btn btn-primary">Create New Staff</a>
        
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="staff" items="${staffList}">
                    <tr>
                        <td>${staff.id}</td>
                        <td>${staff.email}</td>
                        <td>${staff.fullName}</td>
                        <td>${staff.phone}</td>
                        <td>${staff.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/staff/edit/${staff.id}" class="btn btn-sm">Edit</a>
                            <form method="post" action="${pageContext.request.contextPath}/admin/staff/toggle/${staff.id}" style="display: inline;">
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



