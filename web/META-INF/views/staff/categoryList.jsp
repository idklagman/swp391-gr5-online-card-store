<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Categories</h2>
<a href="${pageContext.request.contextPath}/staff/categories?action=new">New category</a>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Status</th><th>Actions</th></tr>
<c:forEach var="c" items="${categories}">
 <tr>
  <td>${c.id}</td><td>${c.name}</td><td>${c.status}</td>
  <td>
    <a href="${pageContext.request.contextPath}/staff/categories?action=edit&id=${c.id}">Edit</a> |
    <a href="${pageContext.request.contextPath}/staff/categories?action=delete&id=${c.id}" onclick="return confirm('Delete?')">Delete</a>
  </td>
 </tr>
</c:forEach>
</table>
</body></html>