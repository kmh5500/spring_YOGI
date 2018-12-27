<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div>

  <form action="" onsubmit="">
  
    <h3>문의 유형</h3>  
    <select>
      <option>문의 유형을 선택하세요</option>
    </select>
    <br><br>
  
    <h3>글 제목</h3>
    <input type="text" name="title">
    <br><br>
      
    <h3>문의내용</h3>
    <textarea rows="10" cols="70" name="content"></textarea>
    <ul style="font-size: 13px">
      <li>내용은 10자 이상 입력해주세요.</li>
      <li>문의하시는 호텔 이름과 예약 정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
      <li>휴대폰 번호는 유선 답변을 위해 수집되며, 답변 완료 후 즉시 삭제됩니다.</li>
    </ul>
    <br>
  
    <h3>휴대폰 번호</h3>
    <input type="text" name="phone" placeholder="선택사항입니다.">
    <br><br>
  
    <h3>비밀번호</h3>
    <input type="password" name="passwd">
    <br><br>
  
    <input type="checkbox">글 비공개 설정
    <br><br>
  
    <div>
      <input type="submit" value="작성 완료">
      <input type="reset" value="리셋">
      <input type="button" value="뒤로가기">
      <input type="button" value="홈">
    </div>

  </form>
  
</div>

</body>
</html>