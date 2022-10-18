<%@page import="java.math.BigDecimal"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="example04.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<link rel="stylesheet" 
href="/resources/css/bootstrap.min.css">
</head>
<body>
<%	
	String cartId = session.getId();
%>
<jsp:include page="menu.jsp"/>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="Left">
						<a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">
						삭제하기
						</a>
					</td>
					<td align="Right">
						<a href="shipptingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">
						주문하기
						</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th><th>가격</th><th>수량</th>
					<th>금액</th><th>비고</th>
				</tr>
				<% 
					
					ArrayList<BookVO> cartList = (ArrayList<BookVO>)session.getAttribute("cartlist");
					
					double sum = 0;
					if(cartList == null){

				%>
				<tr>
					<td colspan="5" style="text-align:center;">장바구니에 상품이 없습니다.</td>
				</tr>
				<%
					}else{
						for(BookVO product : cartList){
						
							double total = product.getUnitPrice()*product.getQuantity();
							BigDecimal totalBig = new BigDecimal(total);
							sum += total;
				%>
				<tr>
					<td><%=product.getBookId()%>-<%=product.getName()%></td>
					<td><fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/></td>
					<td><%=product.getQuantity()%></td>
					<td><fmt:formatNumber value="<%=totalBig%>" pattern="#,###"/></td>
					<td>
						<a href="removeCart.jsp?id=<%=product.getBookId()%>"
						class="badge badge-danger">삭제</a>
					</td>
				</tr>
				<%
						}
						BigDecimal big = new BigDecimal(sum);	
				%>
				 <tr>
				 	<th></th>
				 	<th></th>
				 	<th>총액</th>
				 	<th><fmt:formatNumber value="<%=big%>" pattern="#,###"/></th>
				 	<th></th>				 				 	
				 </tr>
				 <%
					}
				 %>
			</table>
			<a href="books.jsp" class="btn btn-secondary">&laquo;쇼핑계속하기</a>
		</div>
	</div>


	
<jsp:include page="footer.jsp"/>
</body>
</html>