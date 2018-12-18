<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
 
<body>
<div class="clearfix">
<form name="frm" method="post" action="./read">

<div style="float: center; margin-bottom: 10%;">
 <div style="width: 90%; margin-left: 5%; margin-top: 10%;">
 
	<h3>방 리스트</h3>
	
		<c:choose>
    	<c:when test="${empty list}">
			<h1>해당 방 리스트가 없습니다.</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<div>
					<img src='${root }/room/storage/${dto.rfname}' width="200px" heigh = "200px">
					<p>${dto.rtype }</p>
					<p>${dto.rprice }</p>
					<p>${dto.rrate }</p>
					<p>${dto.rfname }</p>
					<p>${dto.hdto.hname }</p>
					<p>${dto.hdto.hstar }</p>
					
				</div>
			
			</c:forEach>
		</c:otherwise>
		</c:choose>
	
	
	
	
	
	<div class='bottom'>
    	${paging}
  	</div>
 </div>
</div>




</form>
</div>
</body>
</html>