<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Category Form</h2>
<form method="post" action="${pageContext.request.contextPath}/staff/categories">
 <input type="hidden" name="id" value="${category.id}" />
 Name: <input name="name" value="${category.name}" /><br/>
 Description: <input name="description" value="${category.description}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${category.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
   <option value="INACTIVE" ${category.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/staff/categories">Back</a>
</body></html>