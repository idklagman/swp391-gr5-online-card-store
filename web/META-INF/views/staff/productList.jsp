<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Products</h2>
<a href="${pageContext.request.contextPath}/staff/products?action=new">New product</a> |
<a href="${pageContext.request.contextPath}/logout">Logout</a>
<table border="1" cellpadding="4">
 <tr><th>ID</th><th>Name</th><th>Sell Price</th><th>Qty</th><th>Status</th><th>Actions</th></tr>
 <c:forEach var="p" items="${products}">
  <tr>
    <td>${p.id}</td>
    <td>${p.name}</td>
    <td>${p.sellPrice}</td>
    <td>${p.quantity}</td>
    <td>${p.status}</td>
    <td>
      <a href="${pageContext.request.contextPath}/staff/products?action=edit&id=${p.id}">Edit</a> |
      <a href="${pageContext.request.contextPath}/staff/products?action=delete&id=${p.id}" onclick="return confirm('Delete?')">Delete</a>
    </td>
  </tr>
 </c:forEach>
</table>
</body></html>