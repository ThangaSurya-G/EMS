<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data List-Amazon.com</title>
<link rel="stylesheet" href="view.css">
</head>
<%@page import="java.util.Vector" %>
<%@page import="amaze.Product" %>
<body>
<a href="index.jsp">Back</a>
<h1>Product Register List</h1>
<jsp:useBean id="db" class="amaze.DBCode"/>        
<%
    Vector<Product> vt=db.view();
%>

<table border="2" rules="all" cellspacing="20" cellpadding="10" width="100%">
<tr>
<th>ID</th><th>NAME</th><th>SECTION</th>
<th>PRICE</th><th colspan="2">ACTIONS</th>
</tr>
<%
    int k=1;
    for(Product i:vt){
%>
<tr>
    <td><%=k++ %></td><td><%=i.getName() %></td>
    <td><%=i.getSection() %></td><td><%=i.getPrice() %></td>
    <td><a href='edit.jsp?n=edit&i=<%=i.getId()%>'>Edit</a></td>
    <td><a href='view.jsp?n=del&i=<%=i.getId()%>'>Delete</a></td>
</tr>
<%
    }
%>
<%
    String b=request.getParameter("n");
    if(b!=null && b.equals("del")){
        int id=Integer.parseInt(request.getParameter("i"));    
        int r=db.delete(id);
        if(r!=0){
            response.sendRedirect("view.jsp");
        }
    }

%>

</table>
</body>
</html>