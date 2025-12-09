<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Transaction History</h1>
        
        <form method="get" class="filter-form">
            <div class="form-group">
                <label>Type:</label>
                <select name="type">
                    <option value="">All</option>
                    <option value="TOPUP" ${selectedType == 'TOPUP' ? 'selected' : ''}>Top-up</option>
                    <option value="PURCHASE" ${selectedType == 'PURCHASE' ? 'selected' : ''}>Purchase</option>
                    <option value="REFUND" ${selectedType == 'REFUND' ? 'selected' : ''}>Refund</option>
                </select>
            </div>
            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" name="startDate" value="${startDate}">
            </div>
            <div class="form-group">
                <label>End Date:</label>
                <input type="date" name="endDate" value="${endDate}">
            </div>
            <button type="submit" class="btn btn-secondary">Filter</button>
        </form>
        
        <table class="table">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Balance After</th>
                    <th>Status</th>
                    <th>Reference Code</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tx" items="${transactions}">
                    <tr>
                        <td>${tx.type}</td>
                        <td><fmt:formatNumber value="${tx.amount}" type="currency" currencySymbol="₫" /></td>
                        <td><fmt:formatNumber value="${tx.balance}" type="currency" currencySymbol="₫" /></td>
                        <td>${tx.status}</td>
                        <td>${tx.referenceCode}</td>
                        <td><fmt:formatDate value="${tx.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



