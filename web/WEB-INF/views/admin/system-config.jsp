<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>System Configuration - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>System Configuration</h1>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <form method="post" action="${pageContext.request.contextPath}/admin/config">
            <h2>SMTP Configuration</h2>
            <div class="form-group">
                <label>SMTP Host:</label>
                <input type="text" name="smtpHost" value="${smtpHost}" required>
            </div>
            <div class="form-group">
                <label>SMTP Port:</label>
                <input type="text" name="smtpPort" value="${smtpPort}" required>
            </div>
            <div class="form-group">
                <label>SMTP User:</label>
                <input type="email" name="smtpUser" value="${smtpUser}" required>
            </div>
            <div class="form-group">
                <label>SMTP Password:</label>
                <input type="password" name="smtpPassword" placeholder="Enter new password to update">
            </div>
            
            <h2>VietQR Configuration</h2>
            <div class="form-group">
                <label>Bank Code:</label>
                <input type="text" name="vietqrBankCode" value="${vietqrBankCode}" required>
            </div>
            <div class="form-group">
                <label>Bank Account:</label>
                <input type="text" name="vietqrAccount" value="${vietqrAccount}" required>
            </div>
            
            <h2>System Settings</h2>
            <div class="form-group">
                <label>System Name:</label>
                <input type="text" name="systemName" value="${systemName}" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Save Configuration</button>
        </form>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



