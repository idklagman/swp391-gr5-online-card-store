<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Provider Form</h2>
<form method="post" action="${pageContext.request.contextPath}/staff/providers">
 <input type="hidden" name="id" value="${provider.id}" />
 Name: <input name="name" value="${provider.name}" /><br/>
 Contact Info: <input name="contact_info" value="${provider.contactInfo}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${provider.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
   <option value="INACTIVE" ${provider.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/staff/providers">Back</a>
</body></html>