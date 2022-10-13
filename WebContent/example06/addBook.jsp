<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example04.vo.BookVO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="example04.dao.BookRepository" scope="session"/>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 등록</title>
<script type="text/javascript" src="/resources/js/validation2.js"></script>
<script type="text/javascript">
	function logout(){
		location.href="logout.jsp"
	}
</script>
</head>
<body>
<fmt:setLocale value="${param.language}"/>
<fmt:bundle basename="bundle2.message">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">korea</a>|<a href="?language=en">english</a>
			<input type="button" class="btn" value="로그아웃" onclick="logout()">
		</div>
		<form name="newProduct" action="processAddBook.jsp"class="form-horizontal" 
		method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId"/></label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
			</div>
		<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="author"/></label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher"/></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="totalPages"/></label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control">
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
				<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>
				<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New "><fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old"> <fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="Refurbished"> <fmt:message key="condition_Refurbished"/>
 				</div>
			</div>
			 <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="bookImage"/></label>
                <div class="col-sm-5">
                    <input type="file" name="productImage" class="form-control">
                </div>
            </div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="bookCheck()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
	</fmt:bundle>
</body>
</html>