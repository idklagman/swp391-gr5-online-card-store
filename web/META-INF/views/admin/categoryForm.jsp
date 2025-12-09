<%@ page contentType="text/html;charset=UTF-8" %>
<%
 models.Category c = (models.Category) request.getAttribute("category");
 if (c == null) c = new models.Category();
%>
<html><body>
<h2>Category Form</h2>
<form method="post" action="${pageContext.request.contextPath}/admin/categories">
 <input type="hidden" name="id" value="${c.id}" />
 Name: <input name="name" value="${c.name}" /><br/>
 Description: <input name="description" value="${c.description}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${c.status=='ACTIVE' ? 'selected':''}>ACTIVE</option>
   <option value="INACTIVE" ${c.status=='INACTIVE' ? 'selected':''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/admin/categories">Back</a>
</body></html>
