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
	url = url+"?rnum=${dto.rnum}";
	url = url+"&oldfile=${dto.rfname}";
	
	location.href = url;
}
</script>
</head>
<body>
<div class="container">
  <h2>방정보</h2>
  <table class="table">

      <tr>
       <th>방타입</th>
       <td>${dto.rtype}</td>
      </tr>
      <tr>
       <th>가격</th>
       <td>${dto.rprice}</td>
      </tr>
      <tr>
       <th>할인율</th>
       <td>${Math.round(dto.rrate*100) }%</td>
      </tr>
      <tr>
       <th>수용인원</th>
       <td>${dto.acperson}명</td>
      </tr>
      <tr>
       <th>추가인원</th>
       <td>${dto.adperson}명</td>
      </tr>
      <tr>
       <th>사진</th>
       <td><img src='${root }/room/storage/${dto.rfname}' width="200px" heigh="200px"></td>
      </tr>
	  <tr>      
       <th>내용</th>
       <td>${dto.rinfo}</td>
      </tr>
     

  </table>
  <div style="text-align:center">
  <input type='button' value='홈' onclick="location.href='${root}/'">
  <input type='button' value='수정' onclick="update()">
  </div>
  </div> 
</body>
</html>