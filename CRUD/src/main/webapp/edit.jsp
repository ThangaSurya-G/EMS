<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit-Amazon.com</title>
<link rel="stylesheet" href="edit.css">
</head>
<%@page import="java.util.Vector" %>
<%@page import="amaze.Product" %>
<body>
<a href="view.jsp">View Data</a>
<h1>Product Edit Page</h1>
<jsp:useBean id="db" class="amaze.DBCode"/>
<%
   String b=request.getParameter("n");
   if(b!=null && b.equals("edit")){
    int id=Integer.parseInt(request.getParameter("i"));
    Vector<Product> vt=db.view(id);
    for(Product i:vt){
%>
<form method="post">
<label for="n">Name</label>
<input type="text" name="n" id="n" value="<%=i.getName()%>" readonly/><br>

<label>Section</label>
<select name="s" readonly>
<option <%=i.getSection().equals("Electronics")?"selected":"" %>>Electronics</option>
<option <%=i.getSection().equals("Beauty and Care")?"selected":"" %>>Beauty and Care</option>
<option <%=i.getSection().equals("Stationary")?"selected":"" %>>Stationary</option>
<option <%=i.getSection().equals("Grocery")?"selected":"" %>>Grocery</option>
</select><br>

<label for="p">Old Price</label>
<input type="number" name="p" id="p" step='any' readonly value="<%=i.getPrice()%>"/><br>

<label for="np">New Price</label>
<input type="number" name="np" id="np" step='any'/><br>
<div class="button">
    
<input type="submit" name="btn" value="Save"/>
<input type="reset" value="Cancel"/>
</div>
</form>
<%
    }
String m=request.getParameter("btn");
if(m!=null && m.equals("Save")){
float price=Float.parseFloat(request.getParameter("np"));
int r=db.update(id, price);
if(r!=0){
response.sendRedirect("view.jsp");
}
else{
out.print("Failed");
}
}
}
%>
</body>
</html>