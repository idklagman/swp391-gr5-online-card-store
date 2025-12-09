<%@ page contentType="text/html;charset=UTF-8" %>
<%
 models.Product p = (models.Product) request.getAttribute("product");
 if (p == null) p = new models.Product();
%>
<html><body>
<h2>Product Form</h2>
<form method="post" action="${pageContext.request.contextPath}/admin/products">
 <input type="hidden" name="id" value="${p.id}" />
 Category ID: <input name="category_id" value="${p.categoryId}" /><br/>
 Provider ID: <input name="provider_id" value="${p.providerId}" /><br/>
 Name: <input name="name" value="${p.name}" /><br/>
 Description: <input name="description" value="${p.description}" /><br/>
 Cost Price: <input name="cost_price" value="${p.costPrice}" /><br/>
 Sell Price: <input name="sell_price" value="${p.sellPrice}" /><br/>
 Discount %: <input name="discount_percent" value="${p.discountPercent}" /><br/>
 Quantity: <input name="quantity" value="${p.quantity}" /><br/>
 Status:
 <select name="status">
   <option value="ACTIVE" ${p.status=='ACTIVE' ? 'selected':''}>ACTIVE</option>
   <option value="INACTIVE" ${p.status=='INACTIVE' ? 'selected':''}>INACTIVE</option>
 </select><br/>
 <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/admin/products">Back</a>
</body></html>
