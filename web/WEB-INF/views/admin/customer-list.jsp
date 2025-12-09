<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Customers - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Manage Customer Accounts</h1>
        
        <c:if test="${param.success == 'toggled'}">
            <div class="alert alert-success">Customer status updated!</div>
        </c:if>
        
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Wallet Balance</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.email}</td>
                        <td>${customer.fullName}</td>
                        <td>${customer.phone}</td>
                        <td><fmt:formatNumber value="${customer.walletBalance}" type="currency" currencySymbol="₫" /></td>
                        <td>${customer.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/customers/detail/${customer.id}" class="btn btn-sm">View</a>
                            <form method="post" action="${pageContext.request.contextPath}/admin/customers/toggle/${customer.id}" style="display: inline;">
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



