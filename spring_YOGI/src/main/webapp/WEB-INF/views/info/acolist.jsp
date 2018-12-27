<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  } );
  </script>

</head>

<script type="text/javascript">

function bupdate(num) {
	var url = "./update";
	url = url + "?informnum="+num;
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
function bdelete(num) {
	var url = "./delete";
	url = url + "?informnum="+num;
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

</script>
<body>
리스트

	<!-- *********************************************** -->


	<div class="search">

		<form name="frm" method="post" action="./info">
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
			<button type="button" onclick="location.href='./info/create'">등록</button>
			</c:if>
		</form>

	</div>






<div id="accordion" style="size: 50%">

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
							<input type="hidden" value="${dto.informnum }">
							  <h3>${dto.title}<br>${dto.wdate }</h3>
							  <div>
							    <p>${dto.content }</p>
							 	
							 <c:if test="${sessionScope.grade=='Y' }">
							 
							  <button onclick="bupdate(${dto.informnum })">수정</button>
    						  <button onclick="bdelete(${dto.informnum })">삭제</button>
							</c:if>
							 </div>	
					</c:forEach>
	</c:otherwise>

  
</c:choose> 

</div>

<DIV class='bottom'>${paging}</DIV>

</body>
</html>