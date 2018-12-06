<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<body>
<h2>제휴정보수정</h2>
<table>
 <tr>
      <th>제휴내용</th>					
      <td colspan='4' align='left'><TEXTAREA name='content' id='content' style="font-size:12; color:#000000;border:1px solid; width: 100%" rows="30">${dto.content}</TEXTAREA></td>
    </tr>      											
 <tr>
		<th>제휴이름</th>
		<td><input type="text" name="aname" value="" size="25"/></td>
	</tr>													





</table>
<div >
	<input type="button" name="reset" value="다시시도"/>
	<input type="button" name="submit" value="수정"/>
</div>
</body>
</html>