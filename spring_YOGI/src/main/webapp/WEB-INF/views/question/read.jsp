<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function listQ() {
	var url = "list";
	url += "?qnum=${dto.qnum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
function updateQ() {
	var url = "update";
	url += "?qnum=${dto.qnum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
function deleteQ() {
	var temp = window.confirm("정말 삭제하시겠습니까?\n삭제한 글은 복구되지 않습니다.");
	
	if(temp) {
		var url = "delete";
		url += "?qnum=${dto.qnum}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
}
</script>

</head>
<body>

<div>

  <h3>글 제목</h3>
  <c:out value="${dto.title }"/>
  <br><br>
      
  <h3>문의내용</h3>
    <c:out value="${dto.content }" escapeXml="false"/>
  <br><br>

  <form>
    <div>
      <table>
        <tr>
          <td rowspan="2">
            <textarea rows="5" cols=""></textarea>     
          </td>
          <td>
            <input type="button" value="수정">
          </td>
        </tr>
        <tr>
          <td>
            <input type="button" value="삭제">
          </td>
        </tr>
      </table>
    </div>
  
    <div>
      <input type="button" value="수정" onclick="updateQ()">
      <input type="button" value="삭제" onclick="deleteQ()">
      <input type="button" value="목록" onclick="listQ()">
      <input type="button" value="뒤로가기" onclick="history.back()">
      <input type="button" value="홈" onclick="location.href='../'">
    </div>
  </form>
  
</div>

</body>
</html>