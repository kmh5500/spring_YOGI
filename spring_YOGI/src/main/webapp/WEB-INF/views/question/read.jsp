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

  <h3>글 제목</h3>
  <input type="text" name="title" value="${dto.title }">
  <br><br>
      
  <h3>문의내용</h3>
  <textarea rows="10" cols="70" name="content">${dto.content }</textarea>
  <br><br>

  <form>
    <div>
      <table>
        <tr>
          <td rowspan="2">
            <textarea rows="20" cols=""></textarea>     
          </td>
          <td>
            <input type="button" value="수정">
          </td>
        </tr>
        <tr>
          <td>
            <input type="button" value="삭제">
          </td>
        </tr>
      </table>
    </div>
  
    <div>
      <input type="button" value="수정">
      <input type="button" value="삭제">
      <input type="button" value="목록">
      <input type="button" value="뒤로가기" onclick="history.back()">
      <input type="button" value="홈" onclick="location.href='../'">
    </div>
  </form>
  
</div>

</body>
</html>