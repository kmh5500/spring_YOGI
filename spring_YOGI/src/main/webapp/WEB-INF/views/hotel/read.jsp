<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function update(){
	var url = "update";
	url = url+"?hnum=${dto.hnum}";
	url = url+"&oldfile=${dto.hfname}";
	
	location.href = url;
}
</script>
</head>
<body>
<div class="container">
  <h2>호텔정보</h2>
  <table class="table">

      <tr>
       <th>호텔명</th>
       <td>${dto.hname}</td>
      </tr>
      <tr>
       <th>전화번호</th>
       <td>${dto.hphone}</td>
      </tr>
      <tr>
       <th>이메일</th>
       <td>${dto.hemail}</td>
      </tr>
      <tr>
       <th>우편번호</th>
       <td>${dto.hzipcode}</td>
      </tr>
      <tr>
       <th>주소</th>
       <td>${dto.haddress1}<br>
       	   ${dto.haddress2}
       </td>
      </tr>
      <tr>
       <th>사진</th>
       <td><img src='${root }/hotel/storage/${dto.hfname}' width="200px" heigh="200px"></td>
      </tr>
	  <tr>      
       <th>체크인</th>
       <td>${dto.hcheckin}</td>
      </tr>
	  <tr>      
       <th>체크아웃</th>
       <td>${dto.hcheckout}</td>
      </tr>
	  <tr>      
       <th>내용</th>
       <td>${dto.hinfo}</td>
      </tr>
     

  </table>
  <div style="text-align:center">
  <input type='button' value='홈' onclick="location.href='${root}/'">
  <input type='button' value='수정' onclick="update()">
  </div>
  </div> 
</body>
</html>