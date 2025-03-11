<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index-Amazon.com</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Product Register Page</h1>
<a href="view.jsp">View Data</a>
<form method="post">
<label for="n">Enter Name</label>
<input type="text" name="n" id="n"/><br>
<label>Select Section</label>
<select name="s">
    <option>Electronics</option>
    <option>Beauty and Care</option>
    <option>Stationary</option>
    <option>Grocery</option>
    <option>Electronics</option>
</select><br>
<label for="p">Enter Price</label>
<input type="number" name="p" id="p" step='any'/><br>
<div class="button">
    <input type="submit" name="btn" value="Save"/>
<input type="reset" value="Cancel"/>

</div>

</form>
<jsp:useBean id="db" class="amaze.DBCode"/>    
<%
    String b=request.getParameter("btn");
    if(b!=null && b.equals("Save")){
        String name=request.getParameter("n");
        String section=request.getParameter("s");
        float price=Float.parseFloat(request.getParameter("p"));    
        int r=db.insert(name, section, price);
        if(r!=0){
            int c=db.count();
            out.print("Product in Cargo : "+c);
        }
        else{
            out.print("Failed");
        }
    }

%>
</body>
</html>