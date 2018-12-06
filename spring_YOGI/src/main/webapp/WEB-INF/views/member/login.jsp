<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<!-- *********************************************** -->
<h2>로그인</h2>
 
<FORM name='frm' method='POST' action='./login'>
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id"  value='${c_id_val}'>
     	<c:choose>
     		<c:when test="${c_id=='Y' }">
     		
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
     		</c:when>
     		<c:otherwise>
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
     		
     		</c:otherwise>
     	</c:choose>
   
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="pass"></TD>
    </TR>
  </TABLE>
  
  
  <DIV class='bottom'>
  <input type="button" value='ID 찾기' onclick="location.href='./findid'">
  <input type="button" value='/Passwd 찾기' onclick="location.href='./idpwfind'">
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' 
    onclick="location.href='/member/agree'">
  </DIV>
  
</FORM>
  </div>
</body>
</html>