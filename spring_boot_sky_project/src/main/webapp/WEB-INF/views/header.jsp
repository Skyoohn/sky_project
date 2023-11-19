<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>日本語単語</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- web icon -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<link href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"  rel="stylesheet" />
<!-- static/css -->
<link href="/css/styles.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<link href="/css/login_style.css" rel="stylesheet" />
<link href="/css/detail.css" rel="stylesheet" />
<link href="/css/cart.css" rel="stylesheet" />
<link href="/css/pay.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<script src="/js/login_scripts.js"></script>
<script src="/js/summernote.js"></script>
<script src="/js/scripts.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header id="header" class="p-2 fixed-top">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <h1 class="logo me-2"><a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">日本語単語</a></h1>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mt-1 justify-content-center mb-md-0 ms-10">
	          <li><a href="/tango/" class="nav-link px-2 text-black">Tango</a></li>
              <li><a href="/community" class="nav-link px-2 text-black">Community</a></li>
	        </ul>
	
	        <div class="icon-btn d-flex">
		        <div class="dropdown text-end">
				  <a class="d-block link-dark" id="dropdownMenu1" data-mdb-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user"></i></a>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				  	<!-- 로그인(인증된) 사용자인 경우 -->
				  	<sec:authorize access="isAuthenticated()">
				    <li><a id="myPageLink" class="dropdown-item" href="/login/userprofile">마이페이지</a></li>
				    </sec:authorize>
				    <!-- 로그인 안 한 익명일 경우 -->
				    <sec:authorize access="isAnonymous()">
				    <li><a id="myPageLink" class="dropdown-item" href="/login">마이페이지</a></li>
				    </sec:authorize>
				    <sec:authorize access="hasRole('ROLE_ADMIN')">
   						<!-- admin 로그인일 경우 -->
						<li><a class="dropdown-item" href="/admin">관리자페이지</a></li>
					</sec:authorize>
				    <li><hr class="dropdown-divider"></li>
		            <sec:authorize access="isAnonymous()">
						<!-- 로그인 안 한 익명일 경우 -->
		            	<li><a class="dropdown-item" href="/login">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<!-- 로그인(인증된) 사용자인 경우 -->	
						<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
					</sec:authorize>
				  </ul>
				</div>
		    </div>
		    <div class="icon-btn d-flex">
		    	<!-- 로그인(인증된) 사용자인 경우 -->
			  	<sec:authorize access="isAuthenticated()">
			    <div><a href="/cart/${username }" class="d-block link-dark" id="dropdownUser2" aria-expanded="false"><i class="fa-solid fa-cart-shopping"></i></a></div>
			    </sec:authorize>
			    <!-- 로그인 안 한 익명일 경우 -->
			    <sec:authorize access="isAnonymous()">
			    <div><a href="/login" class="d-block link-dark" id="dropdownUser2" aria-expanded="false"><i class="fa-solid fa-cart-shopping"></i></a></div>
			    </sec:authorize>
		    </div>
		    <div class="icon-btn d-flex dropstart">
			  <div class="dropdown-toggle" id="hd-search-btn" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
			    <a href="#" class="d-block link-dark" id="dropdownUser3" aria-expanded="false"><i class="fa-solid fa-magnifying-glass"></i></a>
			  </div>
		        <form class="col-12 col-lg-auto mb-3 mb-lg-0 dropdown-menu">
		          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
		        </form>
			</div>
		    <div class="icon-btn d-flex">
		        <div class="dropdown text-end">
				  <a href="#" class="d-block link-dark" type="button" id="dropdownMenu2" data-mdb-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-globe"></i></a>
				  <ul class="dropdown-menu text-small" aria-labelledby="dropdownMenu2">
				    <li><a href="/" class="dropdown-item" type="button">한국어</a></li>
				    <li><a href="#" class="dropdown-item" type="button">日本語</a></li>
				  </ul>
				</div>
		    </div>
	      </div> 
	    </div> 
  </header>
  <div class="h-box" style="height:63px;width:100%;background:none;"></div>
  
<script>
    // 마이페이지 링크를 클릭했을 때 이벤트 처리
    document.getElementById("myPageLink").addEventListener("click", function(event) {
        // 여기에서 로그인 상태를 확인하는 코드를 작성해야 합니다.
        var isLoggedIn = true; // 예시로 true로 설정
        
        if (!isLoggedIn) {
            // 로그인되어 있지 않으면 로그인 페이지로 이동
            window.location.href = "<c:url value="/login"/>"; // 로그인 페이지 URL로 변경
            event.preventDefault(); // 기본 동작 방지 (링크 이동 방지)
        } else {
            // 로그인되어 있다면 마이페이지로 이동
            window.location.href = "<c:url value="/mypage"/>"; // 마이페이지 URL로 변경
        }
    });
</script>

  