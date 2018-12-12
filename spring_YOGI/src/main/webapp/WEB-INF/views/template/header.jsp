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
<link href="${root }/resources/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
.collapse navbar-collapse{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
font-size:14px;
font-weight:bold;
}

.nav navbar-nav navbar-right ul{
background: rgb(109,109,109);
height:50px;
list-style:none;
margin:0;
padding:0;
}

</style>
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
<!-- 		<div class="w3-dropdown-hover w3-hide-small"> -->
<!--     <button class="w3-button" title="Notifications">Dropdown <i class="fa fa-caret-down"></i></button>      -->
<!--     <div class="w3-dropdown-content w3-card-4 w3-bar-block"> -->
<!--       <a href="#" class="w3-bar-item w3-button">Link</a> -->
<!--       <a href="#" class="w3-bar-item w3-button">Link</a> -->
<!--       <a href="#" class="w3-bar-item w3-button">Link</a> -->
<!--     </div> -->
		<div id="navbar-collapse-02" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right nav nav-pills">
				<li class="propClone dropdown"><a href="${root}/room/list">호텔예약</a></li>
				
				<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button"> 제휴관련 <i class="fa fa-caret-down"></i></button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a class="w3-bar-item w3-button" href="${root}/booking/create">제휴예약</a>
				<a class="w3-bar-item w3-button" href="${root}/booking/create">제휴업체예약</a>
				</div>
				</div>
				
				 
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