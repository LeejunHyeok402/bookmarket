<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>주문 완료</title>
<link rel="stylesheet" 
href="/resources/css/bootstrap.min.css">
</head>
<body>
	<%
	String Shipping_cartId ="";
	String Shipping_name ="";
	String Shipping_shippingDate ="";
	String Shipping_country ="";
	String Shipping_zipCode ="";
	String Shipping_addressName ="";


	Cookie[] cookies = request.getCookies();
	for(int i = 0; i<cookies.length;i++){
		Cookie thisCooike = cookies[i];

		if(thisCooike.getName().equals("Shipping_name")){
			Shipping_name = URLDecoder.decode(thisCooike.getValue());
		}
		if(thisCooike.getName().equals("Shipping_shippingDate")){
			Shipping_shippingDate = URLDecoder.decode(thisCooike.getValue());
		}
		if(thisCooike.getName().equals("Shipping_country")){
			Shipping_country = URLDecoder.decode(thisCooike.getValue());
		}
		if(thisCooike.getName().equals("Shipping_zipCode")){
			Shipping_zipCode = URLDecoder.decode(thisCooike.getValue());
		}
		if(thisCooike.getName().equals("Shipping_addressName")){
			Shipping_addressName = URLDecoder.decode(thisCooike.getValue());
		}
		if(thisCooike.getName().equals("Shipping_cartId")){
			Shipping_cartId = URLDecoder.decode(thisCooike.getValue());
		}
	}
	%>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p>주문은 <%=Shipping_shippingDate%></p>
		<p>주문번호: <%=Shipping_cartId%></p>
	</div>
	<div class="container">
		<p>
			<a href="sessionDelete.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
		</p>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>