<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인페이지</h1>
	
	<!-- 로그인을 했다면 -->
	<sec:authorize access="isAuthenticated()">
	
	 <sec:authentication property="principal.username"/> 님 환영합니다.
	 주문내역:<sec:authentication property="principal.cart.product"/> 
	
	</sec:authorize>
	
	<!-- 로그인을 안했다면 -->
   <sec:authorize access="isAnonymous()">		
		로그인이 필요합니다.			
	</sec:authorize>
</body>
</html>