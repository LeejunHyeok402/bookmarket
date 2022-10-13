<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 아이디 오류</title>
<link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<!-- 상품이 없을 때 보여줄 상품페이지 -->
<!--  머리글에 해당하는 menu.jsp파일의 내용을 포함하는 include 액션 태그를 작성 -->
<jsp:include page="/example06/menu.jsp"/>
<div class="jumbotron">
		<div class ="container">
			<h2 class="alert alert-danger">해당 페이지가 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%></p>
		<p><a href="/BookMarket/example06/books.jsp" class="btn btn-secondary">도서 목록&raquo;</a></p>
	</div>
<jsp:include page="/example06/footer.jsp"/>
</body>