<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// function input(f){
// 	if('${sessionScope.id}'==''){
// 		if(confirm("로그인이 필요합니다.")){
// 			var url = "../member/login"
// 			url += "?hnum=${dto.hnum}";
// 			url += "&rnum=${dto.rnum}";
// 			url += "&nPage=${nPage}";
// 			url += "&nowPage=${param.nowPage}";
// 			url += "&flag=../yogi/read";
			
// 			location.href = url;
			
// 			return false;
// 		}else{
// 			return false;
// 		}
		
// 	}else if(f.revcontent.value==''){
// 		alert("댓글내용을 입력하세요.");
// 		f.revcontent.focus();
// 		return false;
// 	}
// }

function reupdate(hnum, revcontent){
	var f = document.rform;
	f.revcontent.value=revcontent;
	f.revnum.value=revnum;
	f.rbutton.value='수정';
	f.action = "./reupdate";
}

function redelete(revnum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./redelete";
		url += "?revnum="+revnum;
		url += "&hnum=${dto.hnum}";
		url += "&rnum=${dto.rnum}";
		url += "&nowPage=${param.nowPage}";
		url += "&nPage=${nPage}";
		
		location.href = url;
	}
}
</script>
</head>
<body>
<div style="height:1000px">
<div style="float:left; width: 30%; height:320px; margin-bottom: 10%; margin-left:10%;">
  <h2>${hdto.hname }</h2>
  <br>
  <img src='${root }/hotel/storage/${hdto.hfname}'  width="400px" height="300px"> 
</div>
<div style="float:right; width: 50%; height:320px; margin-right:10%;">
<br><br><br>
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
       <th>호텔 상세정보</th>
       <td>${hdto.hinfo}</td>
      </tr>
</table>
</div>
</div>
<hr>
<div style="height:1000px">
<div style="float:left; width: 30%;  margin-left:10%;">
  <h2>방 정보</h2>
  <br>
  <img src='${root }/room/storage/${dto.rfname}'  width="400px" height="300px"> 
</div>
<div style="float:right; width: 50%; margin-top:5%; margin-right:10%;">
  <table class="table">

      <tr>
       <th>방 타입</th>
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
       <th>상세정보</th>
       <td>${dto.rinfo}</td>
      </tr>
  </table>
  </div>  
  </div>  
  
<hr>
  <div style="margin:auto; width:80%">
    
    <h2>호텔 리뷰</h2>
  <c:forEach var="redto" items="${relist }">
  <div style="float:center;margin-left:30%;margin-right:30%;">
  	<p style="float:right">${redto.revid }</p>
  	<p style="font-size:20px">${redto.revtitle }</p>
  	<p>${redto.revcontent }</p>
  	<p style="float:left">${redto.revdate }</p>
  	<p style="float:right">${redto.revstar }점</p>
  	<br>
  	<hr>
  	<c:if test="${sessionScope.id==redto.revid }">
  	<span style="float:right">
  		<a href="javascript:reupdate('${redto.revnum }','${rdto.revcontent}' )">수정</a>|
  		<a href="javascript:redelete('${redto.revnum }')">삭제</a>
  	</span>
  	</c:if>
  </div>
  </c:forEach>
  <span style="text-align:center">${paging }</span>
  	<form name="rform"
  	action="./recreate"
  	method="post"
  	onsubmit="return input(this)">
<%--   	<input type="hidden" name="revid" value="${sessionScope.id }"> --%>
  	<input type="hidden" name="revid" value="user7">
  	<input type="hidden" name="hnum" value="${param.hnum }">
  	<input type="hidden" name="rnum" value="${param.rnum }">
  	<input type="hidden" name="nPage" value="${nPage }">
  	<input type="hidden" name="nowPage" value="${param.nowPage }">
    <div style="float:center;margin-top:3%; margin-bottom:5%; margin-left:20%; margin-right:20%; text-align:center; border:solid 1px">
  	<table class="table">
  		<tr>
	  		<td>제목</td>
	  		<th><input type="text" name="revtitle" size="80px"></th>
  		</tr>
  		<tr>
	  		<td>내용</td>
	  		<th><textarea rows="4" cols="80" name="revcontent"></textarea></th>
  		</tr>
  		<tr>
	  		<td>호텔 만족도</td>
	  		<th><input type="number" name="revstar" min=0 max=5>점</th>
  		</tr>
  	</table>
  </div> 
  	<input type="submit" name="rbutton" value="등록">
  	</form>
  </div>
</body>
</html>