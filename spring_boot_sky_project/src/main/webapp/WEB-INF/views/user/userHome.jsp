<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- C태그 쓰기 위해 넣은 taglib므로 반드시 확인 --> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>유저페이지</h1>
   <p>principal: <sec:authentication property="principal"/></p>
   <p><sec:authentication property="principal.username"/> 님 환영합니다</p>
   <p><a href="<c:url value="/" />">홈</a></p>
</body>
</html>