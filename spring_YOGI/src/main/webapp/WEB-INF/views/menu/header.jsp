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
			<a href="index.html" class="navbar-brand brand"> 요기어때 </a>
		</div>
		<div id="navbar-collapse-02" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="propClone"><a href="/views/home.jsp">Home</a></li>
				<li class="propClone"><a href="${root}/room/list">호텔예약</a></li>
				<li class="propClone"><a href="${root}/hotel/create">호텔등록</a></li>
				<li class="propClone"><a href="${root}/room/create">방등록</a></li>
				<li class="propClone"><a href="${root}/booking/create">제휴관련</a></li>
				<li class="propClone"><a href="checkout.html">예약내역</a></li>
				<li class="propClone"><a href="contact.html">게시판</a></li>
				<li class="propClone"><a href="contact.html" style="color:gold">마이페이지</a></li>
				
			</ul>
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