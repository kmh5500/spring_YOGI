<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<DIV class="w3-center">${dto.name}의 회원정보</DIV>
 

  <TABLE>
   
     <TR>
      <TH>아이디</TH>
      <TD>${dto.id}</TD>
    </TR>
      <TR>
      <TH>성명</TH>
      <TD>${dto.name}</TD>
    </TR>
      <TR>
      <TH>전화번호</TH>
      <TD>${dto.phone}</TD>
    </TR>
      <TR>
      <TH>이메일</TH>
      <TD>${dto.email}</TD>
    </TR>
  
  </TABLE>
  
  <DIV class='bottom'>
    
    <input type='button' value='정보수정' onclick="Mupdate()">
	<c:if test="${not empty sessionScope.id && sessionScope.grade != 'Y'}">
    <input type='button' value='패스워드 변경' onclick="updatePw()">
  	</c:if>

    <input type='button' value='탈퇴' onclick="Del()">
  </DIV>

 
 
</body>
</html>