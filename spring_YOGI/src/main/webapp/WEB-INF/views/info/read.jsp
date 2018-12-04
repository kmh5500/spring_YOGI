<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function bupdate() {
	var url = "./update";
	url = url + "?informnum=${dto.informnum}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
function bdelete() {
	var url = "./delete";
	url = url + "?informnum=${dto.informnum}";
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



<div class="w3-container" style="width:100%">
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
	
</div>

  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='등록' onclick="location.href='./create'">
    <button onclick="bupdate()">수정</button>
    <button onclick="bdelete()">삭제</button>
    <button onclick="breply()">답변</button>
  </DIV>
 <hr>


<div style="text-align:center">
${paging }
</div>
</body>
</html>