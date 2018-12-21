<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<div align='center' style='border:1px solid black; font-family:verdana'>
<h3 style='color: blue;'>                                            
환영 합니다.</h3>                               
<p><strong>${dto.name }</strong>님의 회원 가입이 완료 되었습니다. <br>로그인하여 이용해주세요 감사합니다.  </p>
<div>ID:${dto.id }<br>Email:${dto.email }</div>

</div>                                                          
</body>
</html>