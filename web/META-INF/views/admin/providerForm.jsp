<%@ page contentType="text/html;charset=UTF-8" %>
<%
 models.Provider p = (models.Provider) request.getAttribute("provider");
 if (p == null) p = new models.Provider();
%>
<html><body>
<h2>Provider Form</h2>
<form method="post" action="${pageContext.request.contextPath}/admin/providers">
 <input type="hidden" name="id" value="${p.id}" />
 Name: <input name="name" value="${p.name}" /><br/>
 Contact Info: <input name="contact_info" value="${p.contactInfo}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${p.status=='ACTIVE' ? 'selected':''}>ACTIVE</option>
   <option value="INACTIVE" ${p.status=='INACTIVE' ? 'selected':''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/admin/providers">Back</a>
</body></html>
