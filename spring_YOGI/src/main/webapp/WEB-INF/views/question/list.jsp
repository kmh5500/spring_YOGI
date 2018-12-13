<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function readQ(qnum) {
	var url = "read";
	url += "?qnum=" + qnum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
	
}
</script>

</head>
<body>

<div>

  <div>
    <h2>문의 글 목록</h2>
  </div>

  <div>
    <form name="frm" method="post" action="list">
      <select name="col">
        <option value="qtype">문의 유형</option>
        <option value="wname">작성자</option>
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="title_content">제목+내용</option>
        <option value="total">전체 출력</option>      
      </select>
      <script type="text/javascript">
		document.frm.col.value = "${col}";
      </script>
      
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
        <td>${util:questionType(dto.qtype) }</td>
        <td>${dto.wname }</td>
        <td>
          <a href="javascript:readQ('${dto.qnum }')">${dto.title }</a>
        </td>
        <td>${dto.wdate }</td>
        <td>일단 보류.</td>
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