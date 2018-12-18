<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function blist() {
	var url = "./list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
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
function breply() {
	var url = "./reply";
	url = url + "?informnum=${dto.informnum}";
	location.href = url;
}
</script>
<body>



<div class="container" style="width:50%">
	<div class=" w3-bar w3-panel w3-pale-red w3-leftbar w3-border-red">
	  <p>게시글 내용</p>
	  <div class="w3-right-align">
	  작성자: ${dto.wname} 
	  조회수: ${dto.viewcnt}
	  등록일: ${dto.wdate}
	  </div>
	</div>
	<div class=" w3-border w3-bar w3-light-grey">
	<div class="w3-left"><p>제목: ${dto.title}</p></div>

	</div>
	
	<div class="w3-container w3-border w3-large">
	
    <div class="w3-left-align" style="width:100%; height:400px"><p>${dto.content}</p></div>
   
  </div>
	
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
    <c:if test="${sessionScop.grade=='y' }">
    <input type='button' value='등록' onclick="location.href='./create'">
    <button onclick="bupdate(${dto.informnum})">수정</button>
    <button onclick="bdelete(${dto.informnum})">삭제</button>
    </c:if>
  </DIV>
</div>

 <hr>



</body>
</html>