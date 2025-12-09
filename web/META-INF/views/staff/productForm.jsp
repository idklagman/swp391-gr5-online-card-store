<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Product Form</h2>
<form method="post" action="${pageContext.request.contextPath}/staff/products">
 <input type="hidden" name="id" value="${product.id}" />
 
 Category:
 <select name="category_id">
   <option value="">-- Select category --</option>
   <c:forEach var="c" items="${categories}">
     <option value="${c.id}" ${product.categoryId == c.id ? 'selected' : ''}>${c.name}</option>
   </c:forEach>
 </select><br/>

 Provider:
 <select name="provider_id">
   <option value="">-- Select provider --</option>
   <c:forEach var="pr" items="${providers}">
     <option value="${pr.id}" ${product.providerId == pr.id ? 'selected' : ''}>${pr.name}</option>
   </c:forEach>
 </select><br/>

 Name: <input name="name" value="${product.name}" /><br/>
 Description: <input name="description" value="${product.description}" /><br/>
 Cost Price: <input name="cost_price" value="${product.costPrice}" /><br/>
 Sell Price: <input name="sell_price" value="${product.sellPrice}" /><br/>
 Discount %: <input name="discount_percent" value="${product.discountPercent}" /><br/>
 Quantity: <input name="quantity" value="${product.quantity}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${product.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
   <option value="INACTIVE" ${product.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/staff/products">Back</a>
</body></html>