<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function checkQ(f) {
	if(f.qtype.value == "0") {
		alert("문의 유형을 선택해주세요.");
		f.qtype.focus();
		
		return false;
	}	
	if(f.wname.value == "") {
		alert("작성자명을 입력하세요.");
		f.wname.focus();
		
		return false;
	}
	if(f.title.value == "") {
		alert("제목을 입력하세요.");
		f.title.focus();
		
		return false;
	}
	if(f.content.value == "") {
		alert("내용을 입력하세요.");
		f.content.focus();
		
		return false;
	}
	if(f.passwd.value == "") {
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		
		return false;
	}
}

function listQ() {
	var url = "list";
	url += "?qnum=${dto.qnum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
</script>

</head>
<body>

<br><br>

<div style="margin-left: 5%">

  <form name="frm" action="update" method="post" onsubmit="return checkQ(this)">
    <input type="hidden" name="qnum" value="${dto.qnum }">
    <input type="hidden" name="col" value="${param.col }">
    <input type="hidden" name="word" value="${param.word }">
    <input type="hidden" name="nowPage" value="${param.nowPage }">
  
    <h3>문의 유형</h3>
    <select name="qtype">
      <option value="0">문의 유형을 선택하세요</option>
      <option value="Q01">예약/결제</option>
      <option value="Q02">취소/환불</option>
      <option value="Q03">이용문의</option>
      <option value="Q04">회원정보</option>
      <option value="Q05">기타</option>
    </select>
    <script type="text/javascript">
		document.frm.qtype.value = "${dto.qtype}";
    </script>
    <br><br>
  
    <h3>작성자명</h3>
    <c:out value="${dto.wname }"/>
    <br><br>
    
    <h3>글 제목</h3>
    <input type="text" name="title" size="50" value="<c:out value="${dto.title }"/>">
    <br><br>
  
    <h3>휴대폰 번호</h3>
    <c:choose> 
      <c:when test="${dto.phone == null }">
        <input type="text" name="phone" placeholder=" 선택사항입니다.">
      </c:when>
      <c:otherwise>
        <input type="text" name="phone" value="${dto.phone }">
      </c:otherwise>
    </c:choose>
    <br><br>
      
    <h3>문의내용</h3>
    <textarea rows="10" cols="70" name="content" style="margin-bottom: 5px"><c:out value="${dto.content }"/></textarea>
    <div style="margin-left: 20px">
      <ul style="font-size: 13px">
        <li>내용은 10자 이상 입력해주세요.</li>
        <li>문의하시는 호텔 이름과 예약 정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
        <li>휴대폰 번호는 유선 답변을 위해 수집되며, 답변 완료 후 즉시 삭제됩니다.</li>
      </ul>
    </div>
    <br>
  
    <h3>비밀번호</h3>
    <input type="password" name="passwd">
    <br><br>
  
    <input type="checkbox">글 비공개 설정
    <br><br>
  
    <div>
      <input type="submit" value="수정">
      <input type="reset" value="리셋">
      <input type="button" value="목록" onclick="listQ()">
      <input type="button" value="뒤로가기" onclick="history.back()">
      <input type="button" value="홈" onclick="location.href='../'">
    </div>

  </form>
  
</div>

<br><br><br>

</body>
</html>