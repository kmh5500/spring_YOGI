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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
<script type="text/javascript">
$(function(){
	$("#navbar-collapse-02 ul li").hover(function(){
	  $(this).children("ul").show();
	},function(){
	  $(this).children("ul").hide();
	});
	
	
	
	$("modallogin").click(function(){
		$("#id01").modal();
		
	})
	
	$("#modalSubmit").click(function(){
		var data = {
				"id" : $("#id").val(),
				"pass": $("#pass").val()
		};
		

		
		$.ajax({
			url : "${root}/member/login",
			type : "POST",
			data : data,
			success : function(data){
				if(data=="1"){
				document.getElementById('id01').style.display='none';
				location.reload();
				}else{
					alert("로그인 정보가 일치하지 않습니다.");
				}
			}
		})
		
		
	});
	
	
	
});



</script>

</head>
<body>


<div class="w3-container">
  <h2>W3.CSS Login Modal</h2>


  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
       
      </div>

<!--       <form class="w3-container" action="./member/login" method="POST"> -->
      <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text"  name="id" id="id" value='${c_id_val}'>
      
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="pass" id="pass"></TD>
    </TR>
  </TABLE>
  
  
  <DIV class='bottom'>
 
<!--     <input type='submit' value='로그인'> -->
<button id="modalSubmit" type="button" class="btn btn-seccess">Login </button>
   
  </DIV>
<!--       </form> -->

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <input class="w3-right w3-padding w3-hide-small" 
        type="button" value='ID 찾기' onclick="location.href='${root}/member/findid'">
  		<input class="w3-right w3-padding w3-hide-small" 
  		type="button" value='Passwd 찾기' onclick="location.href='${root}/member/findpass'">
<!--         <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span> -->
      </div>

    </div>
  </div>
</div>
            
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
			<a href="#" class="navbar-brand brand"> 요기어때 </a>
		</div>
		<div id="navbar-collapse-02" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="propClone"><a href="/views/home.jsp">Home</a></li>
				<li class="propClone"><a href="#">호텔예약</a></li>
				<li class="propClone"><a href="#">제휴 보기</a></li>
				<li class="propClone"><a href="#">게시판</a>
						<ul style="list-style-type: none;">
					     <li><a href="${root}/info/list">공지사항</a></li>
					     <li><a href="#">문의 게시판</a></li>
					   </ul>								
				</li>
				
				
				<c:choose>
					<c:when test="${empty sessionScope.id }">
<%-- 					<li class="propClone"><a href="${root }/member/login" style="color:gold">로그인</a></li> --%>
					<li class="propClone"><a onclick="document.getElementById('id01').style.display='block'" style="color:gold" >로그인</a></li>
					<li class="propClone"><a href="${root }/member/choice" style="color:gold">회원가입</a></li>
					
					
	
					</c:when>
					<c:otherwise>
					
					
					

					<li class="propClone"><a href="#" style="color:gold">마이페이지</a>
						<ul style="list-style-type: none;">
					     <li><a href="${root }/member/read">내정보</a></li>
<!-- 					     	호텔 관리자 목록 -->
					     <c:if test="${sessionScope.grade=='H' }">
					     <li><a href="#">호텔등록</a></li>
					     <li><a href="#">내 호텔 정보</a></li>
					     <li><a href="#">호텔 예약 정보</a></li>
					     </c:if>
<!-- 					  		업체관리자 목록 -->
					     <c:if test="${sessionScope.grade=='A' }">
					     
					     <li><a href="#">업체 등록</a></li>
					     <li><a href="#">내 업체 정보</a></li>
					     <li><a href="#">업체 예약 정보</a></li>
					     
					     </c:if>
					   	<c:if test="${sessionScope.grade=='P' }">
					     <li><a href="#">예약 현황</a></li>
					     <li><a href="#">내 쿠폰함</a></li>
					     <li><a href="#">내 문의현황</a></li>
					   	
					   	</c:if>
					    
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