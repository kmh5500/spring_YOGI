<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(hnum){
	var url = "read";
	url = url+"?hnum="+hnum;
	location.href = url;
}
</script>
</head> 
<body>
 
<div class="container">
<h2>호텔 등록처리</h2>
<p>${dto.hnum }</p>
<p>${param.hnum }</p>

<c:choose>
	<c:when test="${flag }">호텔등록이 완료되었습니다.<br><br>
    <input type='button' value='호텔정보 보기' onclick="javascript:read('${dto.hnum}')">
    <input type='button' value='홈' onclick="location.href='${root}/'">
	</c:when>
	<c:otherwise>회원가입을 실패하였습니다.<br><br>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='${root}/'">
	</c:otherwise>
</c:choose>
</div>
 
</body>
</html>