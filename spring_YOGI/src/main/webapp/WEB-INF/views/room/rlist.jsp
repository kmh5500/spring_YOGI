<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.list {position:relative; width:900px; height:300px; border: 1px solid #eee; margin:auto}
	div.content {position:absolute; display:block; left:0; bottom:0; width:900px; height:150px; background-color: rgba(0, 0, 0, 0.4); color:white }
	div.list a {text-decoration: none}
	h2.hname {position:absolute; left:5px; top:0px}
	h1.type {position:absolute; left:5px; bottom:5px}
	p.rprice {position:absolute; right:5px; bottom:100px; font-size:20px}
	p.rrate {position:absolute; right:5px; bottom:80px; font-size:20px}
	p.price {position:absolute; right:5px; bottom:5px; font-size:50px}
	p.star {position:absolute; left:5px; top:60px}
</style>
<script type="text/javascript">
function rread(rnum){
	var url = "rread";
	url = url + "?rnum=" + rnum;
	url = url + "&nowPage=${nowPage}";
	location.href = url;
}

</script>
</head>
 
<body>
<div class="clearfix">
<form name="frm">

<div style="float: center; margin-bottom: 10%; margin-top:5%">
	<h1 style="margin-left:10%; margin-bottom:3%">방 리스트</h1>
	
		<c:choose>
    	<c:when test="${empty list}">
			<h1>해당 방 리스트가 없습니다.</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<div class="list">
				<a href="javascript:rread('${dto.rnum}')">
					<img src='${root }/room/storage/${dto.rfname}'  width="900px" height="300px">
				<div class="content">
					<h1 class="type">${dto.rtype }</h1>
					<p class="rprice"><strike>${dto.rprice }원</strike></p>
					<p class="rrate">${Math.round(dto.rrate*100) }%</p>
					<p class="price">${Math.round(dto.rprice*(1-dto.rrate)) }원</p>
					</div>
					</a>
				</div>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		
	<div style="margin:auto; margin-top:20px">
    	${paging}
  	</div>
 </div>

</form>
</div>
</body>
</html>