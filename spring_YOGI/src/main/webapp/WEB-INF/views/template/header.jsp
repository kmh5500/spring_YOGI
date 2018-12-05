<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/ssi.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<div class="w3-bar w3-white w3-large">
  <a href="#" class="w3-bar-item w3-button w3-red w3-mobile"><i class="fa fa-bed w3-margin-right"></i>Logo</a>
  <a href="${root }/member/login" class="w3-bar-item w3-button w3-mobile">로그인</a>
  <a href="${root }/info" class="w3-bar-item w3-button w3-mobile">공지사항</a>
  <a href="${root }/member/choice" class="w3-bar-item w3-button w3-mobile">회원가입</a>
  <a href="#contact" class="w3-bar-item w3-button w3-mobile">Contact</a>
  <a href="#contact" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">Book Now</a>
	
	<c:choose>
 		<c:when test="${empty sessionScope.id }">
 		    <li class="nav-item"><a class="nav-link" href="${root }/member/agree"> Sign Up</a></li>
  		    <li class="nav-item"><a  class="nav-link" href="${root }/member/login"> Login</a></li>
  		    <li class="nav-item"><a  class="nav-link" href="${root }/member/logout"> Logout</a></li>
 		</c:when>
 		<c:otherwise>	
 			
 			<li class="nav-item"><a  class="nav-link" href="${root }/member/read">Myinfo</a></li>
     	<li class="nav-item"><a  class="nav-link" href="${root }/member/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
  		<li class="nav-item"><a class="nav-link" href="${root }/member/delete">회원 탈퇴</a></li>s
 			
 		</c:otherwise>
 	</c:choose>
 	
 	
 	<c:if test="${not empty sessionScope.id && sessionScope.grade =='Y' }">
    	
     <li id="admin"><a  class="nav-link" href="${root }/admin/list">회원목록</a></li>
     <li id="admin"><a  class="nav-link" href="${root }/team/list">직원목록</a></li>
     <li id="admin"><a  class="nav-link" href="${root }/team/create">직원등록</a></li>
     <li class="nav-item"><a  class="nav-link" href="${root }/member/logout"> Logout</a></li>
  
    </c:if>
	
	
</div>
</body>
</html>