<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="${root }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="${root }/resources/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

<!-- <!-- Latest compiled and minified CSS --> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- <!-- jQuery library --> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- <!-- Popper JS --> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> -->

<!-- <!-- Latest compiled JavaScript --> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
</head>


<body>


<!-- HEADER =============================-->
<header class="item header margin-top-0">
<div class="wrapper">
	<nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle" type="button">
			<i class="fa fa-bars"></i>
			<span class="sr-only">Toggle navigation</span>
			</button>
			<a href="${root}/views/home.jsp" class="navbar-brand brand"> 요기어때 </a>
		</div>
		<div id="navbar-collapse-02" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="propClone"><a href="shop.html">호텔예약</a></li>
				<ul>
				<li class="propClone" >
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">제휴관련</a></li>
				<li class="propClone" ><a href="${root}/booking/create">제휴예약</a></li>
				<li class="propClone" ><a href="${root}/booking/create">제휴업체예약</a></li>
				</ul>
				<li class="propClone"><a href="checkout.html">예약내역</a></li>
				<ul>
				<li class="propClone"><a href="contact.html">더보기</a></li>
				<li class="propClone"><a href="contact.html">공지사항</a></li>
				<li class="propClone"><a href="contact.html">Q&A</a></li>
				</ul>
				<li class="propClone"><a href="contact.html" style="color:gold">마이페이지</a></li>


<!--  <li><a href="#">Home</a></li> -->
<!--  <li><a href="#" id="current">Products</a> -->
<!-- 	<ul> -->
<!--      <li><a href="#">Sliders</a></li> -->
<!--      <li><a href="#">Galleries</a></li> -->
<!--      <li><a href="#">Apps</a></li> -->
<!--      <li><a href="#">Extensions</a></li> -->
<!--     </ul> -->
<!--  </li> -->
<!--  <li><a href="#">Company</a></li> -->
<!--  <li><a href="#">Address</a></li> -->
		
			</ul>
			
			
<!-- 			 <ul class="nav nav-pills"> -->
<!--   <li class="nav-item"> -->
<%--     <a class="nav-link active" href="${root }/">홈</a> --%>
<!--   </li> -->
<!--   <li class="nav-item dropdown"> -->
<!--     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a> -->
<!--     <div class="dropdown-menu"> -->
<%--       <a class="dropdown-item" href="${root }/bbs/create">게시판 등록</a> --%>
<%--       <a class="dropdown-item" href="${root }/bbs/list">게시판 목록</a> --%>
<!--     </div> -->
<!--   </li> -->
<!--   <li class="nav-item dropdown"> -->
<!--     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">메모</a> -->
<!--     <div class="dropdown-menu"> -->
<%--       <a class="dropdown-item" href="${root }/memo/create">메모 등록</a> --%>
<%--       <a class="dropdown-item" href="${root }/memo/list">메모 목록</a> --%>
<!--     </div> -->
<!--   </li> -->
<!--   <li class="nav-item dropdown"> -->
<!--     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">이미지</a> -->
<!--     <div class="dropdown-menu"> -->
<%--       <a class="dropdown-item" href="${root }/img/create">이미지 등록</a> --%>
<%--       <a class="dropdown-item" href="${root }/img/list">이미지 목록</a> --%>
<!--     </div> -->
<!--   </li> -->
<!--   <li class="nav-item dropdown"> -->
<!--     <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a> -->
<!--     <div class="dropdown-menu"> -->
<%--       <a class="dropdown-item" href="${root }/board/create">게시판 등록</a> --%>
<%--       <a class="dropdown-item" href="${root }/board/list">게시판 목록</a> --%>
<!--     </div> -->
<!--   </li> -->
  
<!--     </ul>  -->
			
			
			
			
			
		</div>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="text-homeimage">
					<div class="maintext-image" data-scrollreveal="enter top over 1.5s after 0.1s">
						 Increase Digital Sales
					</div>
					<div class="subtext-image" data-scrollreveal="enter bottom over 1.7s after 0.3s">
						 Boost revenue with Scorilo
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</header>