<%@page import="java.util.ArrayList"%>
<%@page import="example04.vo.BookVO"%>
<%@page import="example04.dao.BookRepository"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	
	//만약 없는 id없는 값이면
	if(id == null || id.trim().equals("")){
		response.sendRedirect("Products.jsp");
		return;
	}
	
	//상품 저장소 클래스(ProductRepository) => 싱글톤 객체 생성(메모리에 1회 생성. 공유해서 사용)
	BookRepository dao = BookRepository.getInstance();
	//상품검색메소드(select * from product where id="Z1234")
	BookVO product = dao.getBookById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");	
		return;
	}
	
	
	//장바구니(세션)안에 P1234 상품이 있는지 체크한 후
	//만약 있다면 장바구니에서 제외 처리
	ArrayList<BookVO> cartList = (ArrayList<BookVO>)session.getAttribute("cartlist");
	for(int i = 0; i<cartList.size();i++){
		//cartList.get(i).getProductId().equals(id) 장바구니 안에 있는 상품의 기본키
		
		if(cartList.get(i).getBookId().equals(id)){
			cartList.remove(cartList.get(i));
		}
	}
	if(cartList.size() == 0){
		session.invalidate();
	}
// 	for(ProductVO vo : cartList){
// 		out.println("vo: "+vo.toString()+"<br>");
// 	}
	
	response.sendRedirect("cart.jsp");
%>