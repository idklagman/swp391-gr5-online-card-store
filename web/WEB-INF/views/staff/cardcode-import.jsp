<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Import Card Codes - Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="../fragments/header.jsp" />

<div class="container">
    <h1>Import Card Codes</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <c:if test="${not empty param.success}">
        <div class="alert alert-success">Imported ${param.success} codes</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/staff/cardcodes/import">
        <div class="form-group">
            <label>Product:</label>
            <select name="productId" required>
                <c:forEach var="p" items="${products}">
                    <option value="${p.id}">${p.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Expiry Date (optional):</label>
            <input type="date" name="expiryDate">
        </div>
        <div class="form-group">
            <label>Codes (each line: code,serial_optional):</label>
            <textarea name="codes" rows="8" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Import</button>
    </form>
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

