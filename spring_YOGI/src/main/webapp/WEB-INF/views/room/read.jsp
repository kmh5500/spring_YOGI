<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<div style="float:left; width: 30%; margin-bottom: 10%; margin-left:10%;">
  <h2>${hdto.hname }</h2>
  <br>
  <img src='${root }/hotel/storage/${hdto.hfname}'  width="400px" height="300px"> 
</div>
<div style="float:right; width: 50%; margin-bottom: 10%; margin-top:5%; margin-right:10%;">

<table class="table">

      <tr>
       <th>전화번호</th>
       <td>${hdto.hphone}</td>
      </tr>
      <tr>
       <th>이메일</th>
       <td>${hdto.hemail}</td>
      </tr>
      <tr>
       <th>우편번호</th>
       <td>${hdto.hzipcode}</td>
      </tr>
      <tr>
       <th>주소</th>
       <td>${hdto.haddress1}<br>
       	   ${hdto.haddress2}
       </td>
      </tr>
	  <tr>      
       <th>체크인</th>
       <td>${hdto.hcheckin}</td>
      </tr>
	  <tr>      
       <th>체크아웃</th>
       <td>${hdto.hcheckout}</td>
      </tr>
      <tr>
      <th></th>
      <td></td>
      </tr>
</table>
</div>
<div style="float:center; margin:auto; width:80%">
<hr>
  <table class="table">

      <tr>
       <th></th>
       <td>${dto.rtype}</td>
       <td>${hdto.hinfo}</td>
       
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
  <input type='button' value='' onclick="update()">
  </div>
  </div> 
</body>
</html>