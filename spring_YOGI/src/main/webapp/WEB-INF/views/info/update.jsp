<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript">

<script type="text/javascript">
function bcheck(f) {
	if (f.wname.value == "") {
		alert("성명을 입력하세요");
		f.wname.focus();
		
		return false;
	}
	if (f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		
		return false;
	}
	if (f.content.value == "") {
		alert("내용을 입력하세요");
		f.content.focus();
		
		return false;
	}
	
}

function blist() {
	var url = "./list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
</script>
<body>
생성

<FORM name='frm' method='POST' action='./update' onsubmit="return bcheck(this)"
	  enctype="multipart/form-data">
<div class="w3-container" style="width:100%">
	<div class=" w3-bar w3-panel w3-pale-red w3-leftbar w3-border-red">
	  <p>글 작성</p>
	  <input type="hidden"  name ="informnum" value="${dto.informnum}">         
	  <input type="hidden"  name ="col" value="${param.col}">         
	  <input type="hidden"  name ="word" value="${param.word}">         
	  <input type="hidden"  name ="nowPage" value="${param.nowPage}">         
		  
	  <div class="w3-right-align"><p>작성자:
		<input type="text" name="wname" value="${dto.wname }">
	  </p></div>
	</div>
	<div class=" w3-border w3-bar w3-light-grey">
	<div class="w3-left"><p>제목:
	<input type="text" name="title" value="${dto.title }" style="width: 300px">
	 </p></div>
	
	</div>
	
	<div class="w3-container w3-border w3-large">
	
    <div class="w3-left-align" style="width:100%; height:400px">
    <textarea style="width:100%; height:400px" name="content">
    ${dto.content }</textarea>
    </div>
 
	
	</div>

  <DIV class='w3-center'>
    <input type='submit' value='수정'>
    <input type='button' value='목록' onclick="blist()">
    <input type="reset" value="입력 취소">
  </DIV>
</div>
</FORM>

</body>
</html>