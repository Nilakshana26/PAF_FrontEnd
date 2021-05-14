
<%@page import="com.Product"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/bootstrap.min.js">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/jquery-3.2.1.js"></script>
<script src="Components/Product.js"></script>
<meta charset="ISO-8859-1">
<title>Product Management</title>
</head>
<body>
	
<div class="container">
<div class="row">
	
	<div class="col-8">
	<form id="formItem" name="formItem">
	
				 Product_Code : 
			<input id="Product_Code" name="Product_Code" type="text" 
			 class="form-control form-control-sm">
			 
			<br>Prod_Name: 
			<input id="	Prod_Name" name="Prod_Name" type="text" 
			 class="form-control form-control-sm">
			 
			<br> Contributors : 
			<input id="Contributors" name="Contributors" type="text" 
			 class="form-control form-control-sm">
			 
			<br> Email: 
			<input id="Email" name="Email" type="text" 
			 class="form-control form-control-sm">
			<br>
			
			<br> Price: 
			<input id="Price" name="Price" type="text" 
			 class="form-control form-control-sm">
			<br>
			
			<input id="btnSave" name="btnSave" type="button" value="Save" 
			 class="btn btn-primary">
			<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
			</form>
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			
			<br>
			<div id="divItemsGrid">
			<%
				Product itemObj = new Product();
				out.print(itemObj.readProduct());
			%>	
			</div>
			
			
			
			
	
		</div>

	</div>

</div>
	
</body>
</html>