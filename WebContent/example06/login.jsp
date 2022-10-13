<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<h3>please sign in</h3>
				<form  name="loginForm" method="post" action="j_security_check">
					<p><input type="text" name="j_username" placeholder="id"/></p>
					<p><input type="password" name="j_password" placeholder="password"/></p>
					<span><input type="submit" class="btn btn-primary" value="로그인"/></span>
				</form>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
</body>
</html>