<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<style type="text/css">
 #navbar-collapse-02 ul ul {display: none} 
</style>
<link href="${root }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="${root }/resources/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
<script type="text/javascript">
$(function(){
	$("#navbar-collapse-02 ul li").hover(function(){
	  $(this).children("ul").show();
	},function(){
	  $(this).children("ul").hide();
	});

});

</script>
	
	
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
				<li class="propClone"><a href="shop.html">호텔예약</a></li>
				<li class="propClone"><a href="${root}/booking/create">제휴관련</a></li>
				<li class="propClone"><a href="checkout.html">예약내역</a></li>
				<li class="propClone"><a href="contact.html">게시판</a>
						<ul>
					     <li><a href="${root}/info/list">공지사항</a></li>
					     <li><a href="#">Galleries</a></li>
					     <li><a href="#">Apps</a></li>
					     <li><a href="#">Extensions</a></li>
					   </ul>								
				</li>
				
				<c:choose>
					<c:when test="${empty sessionScope.id }">
					<li class="propClone"><a href="${root }/member/login" style="color:gold">로그인</a></li>
					<li class="propClone"><a href="${root }/member/choice" style="color:gold">회원가입</a></li>
					
					</c:when>
					<c:otherwise>
					
					
					
					<li class="propClone"><a href="${root }/member/read" style="color:gold">마이페이지</a>
						<ul>
					     <li><a href="#">내정보</a></li>
					     <c:if test="${sessionScope.grade=='H' }">
					     <li><a href="#">호텔등록</a></li>
					     </c:if>
					  
					     <c:if test="${sessionScope.grade=='A' }">
					     <li><a href="#">업체 등록</a></li>
					     </c:if>
					   
					    
					     <li><a href="#">예약 현황</a></li>
					   </ul>
					</li>
					<c:if test="${sessionScope.grade=='Y' }">
					<li class="propClone"><a href="${root }/admin/list" style="color:gold">회원목록</a>
					
					</c:if>
					<li class="propClone"><a href="${root }/member/logout" style="color:gold">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
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