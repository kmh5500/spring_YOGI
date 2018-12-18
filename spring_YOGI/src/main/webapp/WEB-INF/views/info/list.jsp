<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<script type="text/javascript">
function infoRead(informnum){
	var url = "./read";
	url = url + "?informnum="+ informnum;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";

	location.href = url;

}

</script>
<body>
리스트

	<!-- *********************************************** -->

<div class="container">
	<div class="search">

		<form name="frm" method="post" action="./list">
			<select name="col">
				<option value="wname" <c:if test="${col =='wname'}">
				selected</c:if>>성명</option>
				<option value="title" <c:if test="${col =='title'}">
				selected</c:if>>제목</option>
				<option value="content"<c:if test="${col =='content'}">
				selected</c:if>>내용</option>
				<option value="total"<c:if test="${col =='total'}">
				selected</c:if>>
				전체 출력</option>
			</select> <input type="text" name="word" value="${word}">

			<button>검색</button>
			<c:if test="${sessionScope.grade=='Y' }">
			<button type="button" onclick="location.href='./create'">등록</button>
			</c:if>
		</form>

	</div>

	

		<h2>
			<span class="glyphicon glyphicon-th-list"></span> 게시판 목록
		</h2>

		<table class="table table-hover">
			<thead>
				<TR>
					<TH>번호</TH>
					<TH>성명</TH>
					<TH>제목</TH>
					<TH>조회수</TH>
					<TH>등록일</TH>
				</TR>
			</thead>

			<c:choose>
				<c:when test="${empty list }">
					<tbody>
						<tr>
							<td colspan="6">등록된 글이 없습니다.</td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<tbody>
							<TR>
								<td>${dto.informnum}</td>
								<td>${dto.wname}</td>
								<td>
									
									<a href="javascript:infoRead('${dto.informnum}')">${dto.title}</a> 
									 
									<c:if
										test="${util:newImg(dto.wdate) }">
										<img src="${pageContext.request.contextPath}/images/new.jpg">
									</c:if>
									</td>
								<td>${dto.viewcnt}</td>
								<td>${dto.wdate}</td>
								
							</TR>
						</tbody>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</TABLE>

		<DIV class='bottom'></DIV>

	</div>
<DIV class='bottom'>${paging}</DIV>

</body>
</html>