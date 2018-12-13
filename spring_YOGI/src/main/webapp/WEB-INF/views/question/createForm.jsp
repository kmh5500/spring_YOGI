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
	if(f.qType.value == "0") {
		alert("문의 유형을 선택해주세요.");
		f.qType.focus();
		
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
</script>

</head>
<body>

<br><br>

<div style="margin-left: 5%">

  <form action="create" method="post" onsubmit="return checkQ(this)">
  
    <h3>문의 유형</h3>  
    <select name="qType">
      <option value="0">문의 유형을 선택하세요</option>
      <option value="1">예약/결제</option>
      <option value="2">취소/환불</option>
      <option value="3">이용문의</option>
      <option value="4">회원정보</option>
      <option value="5">기타</option>
    </select>
    <br><br>
  
    <h3>작성자명</h3>
    <input type="text" name="wname">
    <br><br>
    
    <h3>글 제목</h3>
    <input type="text" name="title" size="50">
    <br><br>
      
    <h3>문의내용</h3>
    <textarea rows="10" cols="70" name="content" style="margin-bottom: 5px"></textarea>
    <div style="margin-left: 20px">
      <ul style="font-size: 13px">
        <li>내용은 10자 이상 입력해주세요.</li>
        <li>문의하시는 호텔 이름과 예약 정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
        <li>휴대폰 번호는 유선 답변을 위해 수집되며, 답변 완료 후 즉시 삭제됩니다.</li>
      </ul>
    </div>
    <br>
  
    <h3>휴대폰 번호</h3>
    <input type="text" name="phone" placeholder=" 선택사항입니다.">
    <br><br>
  
    <h3>비밀번호</h3>
    <input type="password" name="passwd">
    <br><br>
  
    <input type="checkbox">글 비공개 설정
    <br><br>
  
    <div>
      <input type="submit" value="작성 완료">
      <input type="reset" value="리셋">
      <input type="button" value="뒤로가기" onclick="history.back()">
      <input type="button" value="홈" onclick="location.href='../'">
    </div>

  </form>
  
</div>

<br><br><br>

</body>
</html>