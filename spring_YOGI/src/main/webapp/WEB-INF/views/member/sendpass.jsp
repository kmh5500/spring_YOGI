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
<c:choose>
	<c:when test="${flag }">
	비밀번호를 발송하였습니다.이메일을 확인하세요
	</c:when>
	<c:otherwise>
	해당 email은 가입되어있지 않습니다.
	</c:otherwise>
</c:choose>
</body>
</html>