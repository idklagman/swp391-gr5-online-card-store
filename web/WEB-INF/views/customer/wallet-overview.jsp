<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Wallet Overview - Online Card Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <jsp:include page="../fragments/header.jsp" />
    
    <div class="container">
        <h1>Wallet Overview</h1>
        
        <div class="wallet-balance">
            <h2>Current Balance</h2>
            <p class="balance-amount"><fmt:formatNumber value="${walletBalance}" type="currency" currencySymbol="₫" /></p>
            <a href="${pageContext.request.contextPath}/customer/wallet/topup" class="btn btn-primary">Top-up Wallet</a>
            <a href="${pageContext.request.contextPath}/customer/wallet/transactions" class="btn btn-secondary">View All Transactions</a>
        </div>
        
        <div class="recent-transactions">
            <h2>Recent Transactions (Last 5)</h2>
            <c:if test="${empty recentTransactions}">
                <p>No transactions yet</p>
            </c:if>
            <c:if test="${not empty recentTransactions}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Balance After</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tx" items="${recentTransactions}">
                            <tr>
                                <td>${tx.type}</td>
                                <td><fmt:formatNumber value="${tx.amount}" type="currency" currencySymbol="₫" /></td>
                                <td><fmt:formatNumber value="${tx.balance}" type="currency" currencySymbol="₫" /></td>
                                <td>${tx.status}</td>
                                <td><fmt:formatDate value="${tx.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    
    <jsp:include page="../fragments/footer.jsp" />
</body>
</html>



