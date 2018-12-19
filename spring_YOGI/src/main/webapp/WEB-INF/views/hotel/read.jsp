<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>호텔정보</h2>
  <table class="table">

      <tr>
       <th>성명</th>
       <td>${dto.hname}</td>
      </tr>
      <tr>
       <th>사진</th>
       <td>${dto.filename}</td>
      </tr>
	  <tr>      
       <th>내용</th>
       <td>${dto.hinfo}</td>
      </tr>
     

  </table>
  <div style="text-align:center">
  <button onclick="list()">목록</button>
  <button onclick="update()">수정</button>
  </div>
 
  </div> 
</body>
</html>