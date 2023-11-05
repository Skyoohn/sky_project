<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | 日本語単語</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="/"><img src="images/home/logo.png" alt="" /></a>
						</div>

					</div>

				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/" class="active" style="color: skyblue">Home</a></li>
								<li class="dropdown"><a href="#">단어<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.html">속담</a></li>
										<li><a href="product-details.html">사자성어</a></li> 
										<li><a href="checkout.html">외래어</a></li> 
										<li><a href="cart.html">옛말</a></li>
										<li><a href="login.html">관용구</a></li>
                                    </ul>
                                </li> 
								<li><a href="contact-us.html">About</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	

	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>		

						<div class="carousel-inner">
							<div class="item active">
								<c:forEach var="boardList" items="${boardList}">
								<div class="col-sm-6">
									<h1><span>Most </span>Viewed Words</h1>
									<h2>${boardList.nkanji}</h2>
									<p>${boardList.nruby}</p>
									<a href="/content_view"><button type="button" class="btn btn-default get" style="background-color: skyblue;">View definitions</button></a>
								</div>
								</c:forEach>
								<div class="col-sm-6">
									<img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Most </span>saved words</h1>
									<h2>侍</h2>
									<p>さむらい</p>
									<button type="button" class="btn btn-default get" style="background-color: skyblue;">View definitions</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Most </span>difficult words</h1>
									<h2>侍</h2>
									<p>さむらい</p>
									<button type="button" class="btn btn-default get" style="background-color: skyblue;">View definitions</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl1.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
						</div>
<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
  <i class="fa fa-angle-left"></i>
</a>
<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
  <i class="fa fa-angle-right"></i>
</a> 

					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2 style="color: skyblue;">종류</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											속담
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">Nike </a></li>
											<li><a href="#">Under Armour </a></li>
											<li><a href="#">Adidas </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											사자성어
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">Fendi</a></li>
											<li><a href="#">Guess</a></li>
											<li><a href="#">Valentino</a></li>
										</ul>
									</div>
								</div>
							</div>
							

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">외래어</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">옛말</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">관용구</a></h4>
								</div>
							</div>

						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2 style="color: skyblue;">한자 수</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>1개</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>2개</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>3개</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>4개</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>5개</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>6개</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>7개 이상</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
						

						
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center" style="color: skyblue;">최근 등록 된 단어</h2>

<div class="row">
<c:forEach var="boardList" items="${boardList}">
  <c:forEach var="i" begin="1" end="18">
    <div class="col-sm-2">
      <div class="product-image-wrapper">
        <div class="single-products">
          <div class="productinfo text-center">
            <h2 style="color: skyblue;">${boardList.nkanji}</h2>
            <p>${boardList.nruby}</p>
            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-plus-square-o"></i>Save <br>Words</a>
          </div>
        </div>
        <div class="choose">
          <ul class="nav nav-pills nav-justified">
            <li><a href="levelup()"><i class="fa fa-hand-o-right"></i>Selecting the highest difficulty level</a></li>
          </ul>
        </div>
      </div>
    </div>
  </c:forEach>
  </c:forEach>
</div>

					</div><!--features_items-->
					</section>

	<footer id="footer"><!--Footer-->
	
		<div class="footer-top">
			<div class="container text-center">
				<div class="row">
	
						<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
					    <div class="text-center">
					      <p>JP, somewhere, tokyo, japan</p>
					    </div>
						</div>
					</div>
				
					<div class="col-lg-2">
						<div class="companyinfo">
							<h2><span style="color: skyblue;">Muzu_</span>Kanji</h2>
							<p>We'll share some of our favorite Japanese words that are difficult for foreigners to understand.</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/apple.jpg" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-apple"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-android"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-windows"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-linux"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2023 Muzu_Kanji Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com" style="color: skyblue;">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>