
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 



<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
search{
text-align center;
margin: 3px auto;
}
</style> 
<script type="text/javascript">
function read(id) {
	var url="${root}/member/read";
	url = url+"?id="+id;
	url = url+"&col=${col}";
	url = url+"&word=${word}";
	url = url+"&nowPage=${nowPage}";
	location.href=url;
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
 <div class="search">
<FORM name='frm' method='POST' action='./list' >
  <select name="col">
  
  	<option value="id"
  	<c:if test="${col=='id'}">selected</c:if>
  	>아이디</option>
  	<option value="email"
  	<c:if test="${col=='email' }">selected</c:if>
  	>이메일</option>
  	<option value="name"
  	<c:if test="${col=='name' }">selected</c:if>
    >성명</option>
  	<option value="total"
  	<c:if test="${col=='total' }">selected</c:if>
  	>전체출력</option>
  </select>
  <input type="text" name ="word" value= "${word}">
  <button>검색</button>
  </FORM>

  </div>
  
  <div class="container">
  <h2><span class="glyphicon glyhicon-th-list"></span>
  회원 목록
  </h2>
 
 
 

  <TABLE class="table table-hover">
  
  
  <tr>
      <TH style="width: 10%">아이디</TH>
      <TH style="width: 10%">성명</TH>
      <TH style="width: 10%">전화번호</TH>
      <TH style="width: 10%" >이메일</TH>
     <TH style="width: 10%">회원 분류</TH>
  </tr>
  


 <c:forEach var="dto" items="${list }">
    <TR>
      <TD style="width: 20%">
      <a href="javascript:read('${dto.id}')">
      ${dto.id}</a></TD>
      <TD>${dto.name}</TD>
      <TD>${dto.phone}</TD>
      <TD>${dto.email}</TD>
      <TD>${dto.grade}
      (${util:MemberGrade(dto.grade)})</TD>
    </TR>
     
     
   </c:forEach>
    
  </TABLE>

  <DIV class='bottom'>
  ${paging}
    <input type='submit' value=''>
  </DIV>

</div>

 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 