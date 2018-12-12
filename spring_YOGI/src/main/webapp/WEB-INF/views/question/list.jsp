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

  <div>
    <h2>문의 글 목록</h2>
  </div>

  <div>
    <form method="post" action="list">
      <select name="col">
        <option value="qType"
         <c:if test="${col == 'qType' }">selected</c:if>
        >문의 유형</option>
        <option value="wname"
         <c:if test="${col == 'wname' }">selected</c:if>
        >작성자</option>
        <option value="title"
         <c:if test="${col == 'title' }">selected</c:if>
        >제목</option>
        <option value="content"
         <c:if test="${col == 'content' }">selected</c:if>
        >내용</option>
        <option value="title_content"
         <c:if test="${col == 'title_content' }">selected</c:if>
        >제목+내용</option>
        <option value="total"
         <c:if test="${col == 'total' }">selected</c:if>
        >전체 출력</option>      
      </select>
      
      <input type="text" name="word" value="${word }">
    
      <input type="submit" value="검색">   
    </form>
  </div>

  <div>
    <table>
      <tr>
        <th>번호</th>
        <th>문의 유형</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일자</th>
        <th>답변 상태</th>
      </tr>
<c:choose>
  <c:when test="${empty list }">
      <tr>
        <td colspan="6">
          <h3>등록된 글이 없습니다.</h3>
  	    </td>      
      </tr>
  </c:when>
  <c:otherwise>
    <c:forEach var="dto" items="${list }">
      <tr>
        <td>${dto.qnum }</td>
        <td>${dto.qtype }</td>
        <td>${dto.wname }</td>
        <td>${dto.title }</td>
        <td>${dto.wdate }</td>
        <td>일단 보류</td>
      </tr>
    </c:forEach>
  </c:otherwise>
</c:choose>      
    </table>
  </div>
 
  <br>
 
  <div>${paging }</div>
 
</div>

</body>
</html>