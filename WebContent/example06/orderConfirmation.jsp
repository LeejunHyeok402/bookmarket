<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.math.BigDecimal"%>
<%@page import="example04.vo.BookVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
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
<!DOCTYPE html>
<html>
<head>
<title>주문 정보</title>
<link rel="stylesheet" 
href="/resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<!-- ------ 주문정보 시작 -->
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<!-- 고객정보 시작: cookies -->
		<div class="row justify-content-between">
			<strong>배송 주소</strong>
			성명:	 <%=Shipping_name%><br>
			우편번호: <%=Shipping_zipCode%>	<br>
			주소: <%=Shipping_addressName%>&nbsp;<%=Shipping_country%><br>
		</div>
		<div class="col-4" align="right">
			<p>
				<em>배송일: <%=Shipping_shippingDate%></em>
			</p>
		</div>
		<!-- 상품 정보 시작: session 사용 -->
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					//누적 금액 변수 sum
					double sum = 0;
					//cartlist라는 이름의 장바구니(=세션)
					ArrayList<BookVO> cartList=
							(ArrayList<BookVO>)session.getAttribute("cartlist");
					for(int i = 0; i<cartList.size();i++){
						//목록에서 상품을 하나 끄집어내자
						BookVO book =  cartList.get(i);
						//얼마 짜리를 몇개 샀니?
						double total =
								book.getUnitPrice() * book.getQuantity();
						BigDecimal totalBig = new BigDecimal(total);
						
						sum += total;
				%>
				<tr>
					<td class="text-center"><em><%=book.getName() %></em></td>
					<td class="text-center"><em><%=book.getQuantity() %></em></td>
					<td class="text-center"><em><%=book.getUnitPrice() %></em></td>
					<td class="text-center"><em><fmt:formatNumber value="<%=totalBig%>" pattern="#,###"/>원</em></td>
				</tr>
				<%
					}
					BigDecimal sumBig = new BigDecimal(sum);
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액:</strong></td>
					<td class="text-center text-danger"><strong><fmt:formatNumber value="<%=sumBig%>" pattern="#,###"/>원</strong></td>
				</tr>
			</table>
		</div>
		<a href="shipptingInfo.jsp?cartId=<%=Shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
		<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
		<a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		<!-- 상품 정보 끝: session 사용 -->
	</div>
	<!-- ------ 주문정보 끝 -->
	
	<jsp:include page="footer.jsp"/>
</body>
</html>