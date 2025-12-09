<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Providers</h2>
<a href="${pageContext.request.contextPath}/staff/providers?action=new">New provider</a>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Contact</th><th>Status</th><th>Actions</th></tr>
<c:forEach var="p" items="${providers}">
 <tr>
  <td>${p.id}</td><td>${p.name}</td><td>${p.contactInfo}</td><td>${p.status}</td>
  <td>
    <a href="${pageContext.request.contextPath}/staff/providers?action=edit&id=${p.id}">Edit</a> |
    <a href="${pageContext.request.contextPath}/staff/providers?action=delete&id=${p.id}" onclick="return confirm('Delete?')">Delete</a>
  </td>
 </tr>
</c:forEach>
</table>
</body></html>