<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="example04.vo.BookVO"%>
<%@page import="example04.dao.BookRepository"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%> 
<%@page import="java.util.List"%>
<%@page errorPage="/exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<%	//스트립틀릿 태그
	//상세보기 => ProductVO을 리턴
	//SELECT * FROM PRODUCT WHERE PRODUCT_ID = 'P1235'
	String id = request.getParameter("id");
	BookRepository bookRepository = BookRepository.getInstance();
	BookVO bookDetail = bookRepository.getBookById(id);
	System.out.println(bookDetail.toString());
%>
<c:set var="bookVo" value="<%=bookDetail%>" scope="page"/>
<html>
<head>
<link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 상세 정보</title>
<script type="text/javascript">
	//핸들러 함수(상품 주문 버튼 클릭 시 실행)
	function addToCart(){
		let result = confirm("상품을 장바구니에 추가하시겠습니까?");
		if(result){	//true
			console.log("true");
			document.addForm.submit();
		}else{	//false
			console.log("false");
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<!-- ==============================상품상세시작============================== -->
	<div class="container">
		<div class="row">
		<div class="col-5">
		<img alt="${bookVo.name}" src="/resources/images/${bookVo.filename}" style="width:100%;height:100%;">
		</div>
		<div class="col-7">
			<h3>${bookVo.name}</h3>
			<p>${bookVo.desciption}</p>
			<p><b>도서코드: </b><span class="badge badge-danger">${bookVo.bookId}</span></p>
			<p><b>출판사</b>: ${bookVo.publisher}</p>
			<p><b>저자</b>: ${bookVo.author}</p>
			<p><b>제고수</b>: ${bookVo.unitsInStock}</p>
			<p><b>총 페이지수</b>: ${bookVo.totalPages}</p>				
			<p><b>출판일</b>: ${bookVo.releaseDate}</p>				
			<h4>${bookVo.unitPrice}원</h4>	
			<form name="addForm" action="addCart.jsp?id=${bookVo.bookId}" method="post">
				<p>
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
					<a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					<a href="./books.jsp" class="btn btn-secondary">상품목록&raquo;</a>
				</p>	
			</form>
		</div>
		</div>	
		<hr>
	</div>
	
	<!-- ==============================상품상세끝============================== -->
	<jsp:include page="footer.jsp"/>
</body>
</html>