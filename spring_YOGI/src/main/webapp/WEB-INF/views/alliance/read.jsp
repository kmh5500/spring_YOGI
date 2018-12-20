<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function alist(){
	var url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href=url;
	
}
function aread(anum) {
	var url = "./read"
	url += "?anum=" + anum;
	location.href = url;
}
function aupdate(){
	var url = "update";
	url = url + "?content=${dto.content}";
	url = url + "&aname=${dto.aname}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}"
	
	location.href=url;
	
}

                                                                                                                           

	function aupdate(aname,acontent){
	var f = document.aform;
	
	f.content.value = acontent;
	f.aname.value = aname;
	f.asubmit.value="수정";
	f.action="./aupdate"
	}
	

	
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
}
 
.alist{
	line-height: 1.2em;
	font-size:13px;
	font-weight:bold;
	text-align:left;
	border:1px solid black;
	font-style:italic;
	width:35%;
	padding:10px;
	margin:20px auto;
	
}
</style> 
</head>
<body>
<div class="container">
<h2>제휴정보</h2>
 
  <TABLE class="table">
    
    <TR>
      <th>제휴내용</th>	
      <TD colspan="2" class='td'>${dto.content}</TD>
    </TR>
    <TR>
      <TH>제휴이름</TH>
      <TD>${dto.aname}</TD>
    </TR>
    <TR>
      <TH>대표사진</TH>
      <TD>${dto.fname}</TD>
    </TR>
    <TR>
      <TH>상세사진</TH>
      <TD>${dto.sname}</TD>
    </TR>
    <TR>
      <TH>호텔이름</TH>
      <TD>
      ${dto.hname }
      
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="alist()">
    <input type='button' value='등록' onclick="location.href='create'">
    <button onclick="aupdate()">수정</button>
    
   
  </DIV>
  
  <hr>
  <c:forEach var="adto" items="${alist}">
  <div class="alist">
  ${adto.anum }<br>
  <p>${adto.content }</p>
  ${adto.hname }<br>
  <c:if test="${sessionScope.content==adto.content }">
  <span style="float:right">
  <a href="javascript:aupdate('${adto.anum }','${adto.content}')">수정</a>
  <a href="javascript:adelete('${adto.anum }')">삭제</a>
  </span>
  </c:if>
  </div>
  </c:forEach>
  <div class="acreate">
  <form name="rform" action="./acreate" method="post" onsubmit="return input(this)">
  <textarea rows="3" cols="28" name="content" onclick="acheck(this)"></textarea>
  <input type="submit" name="asubmit" value="등록">
  
  <input type="hidden" name="anum" value="${dto.anum}">
  <input type="hidden" name="content" value="${sessionScope.content}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">
  <input type="hidden" name="col" value="${param.col}">
  
   </form>
  </div>
  <div class="bottom">
  ${paging}
  </div>
 </div>
</body>
<!-- *********************************************** -->
</html> 