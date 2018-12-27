<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
  ocument.getElementById('id').scrollIntoView(true);


</script>
</head>
<body>
<div class="container" id="mainwiew">
<!-- *********************************************** -->
<h2>로그인</h2>
 
<FORM name='frm' method='POST' action='./login'>
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text"  name="id"  value='${c_id_val}'>
      
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
  <input type="button" value='/Passwd 찾기' onclick="location.href='./findpass'">
    <input type='submit' value='로그인'>
   
  </DIV>
  
</FORM>
  </div>
</body>
</html>