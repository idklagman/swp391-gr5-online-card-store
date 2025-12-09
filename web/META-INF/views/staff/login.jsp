<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Login</h2>
<c:if test="${not empty error}"><div style="color:red">${error}</div></c:if>
<form method="post" action="${pageContext.request.contextPath}/login">
 Email: <input name="email"/><br/>
 Password: <input type="password" name="password"/><br/>
 <button type="submit">Login</button>
</form>
</body></html>