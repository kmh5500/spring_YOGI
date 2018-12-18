<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
.clearfix:after {
	content:'';
	display:block;
	clear:both;
}
#booking_btn {
	 text-align: center; 
	 padding: 2% 0%; 
	 background-color: #cc0000;
	 width: 100%; 
	 cursor:pointer;
}
#booking_left {
	 float: left; 
	 width: 40%; 
	 margin-bottom: 10%;
}
#booking_right {
	 float: right; 
	 width: 30%; 
	 background-color: #f0eef0; 
	 margin-top: 3%; 
	 margin-bottom: 10%;
	 margin-right: 25%;
}
</style>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
function checkB(f) {
	if(f.bname.value == "") {
		alert("예약자명을 입력해주세요.");
		f.bname.focus();
		
		return false;
	}
	if(f.bphone.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		f.bphone.focus();
		
		return false;
	}		
	if(f.checkAll.checked == false) {
		alert("약관동의를 확인해주세요.");
		f.checkAll.focus();
		
		return false;
	}
	
}

$(function() {
	$("#checkAll").click(function() {
		if ($("#checkAll").prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	})
});

function re(b) {
	var f = document.frm;
	
	if(b.checked == false) {		  	
		f.checkAll.checked = false;
	}
	else if(f.checkOne[0].checked==true && f.checkOne[1].checked==true && f.checkOne[2].checked==true) {
		f.checkAll.checked = true;
	}
}
</script>

</head>
<body>

<!-- div.clearfix 이후에는 float 적용 안 됨 (footer 문제 해결) -->
<div class="clearfix">

  <form name="frm" action="create" method="post" onsubmit="return checkB(this)">
  
    <input type="hidden" name="bhname" value="${param.hname }">
    <input type="hidden" name="brtype" value="${param.rtype }">
    <input type="hidden" name="brinfo" value="${param.rinfo }">
    <input type="hidden" name="bperson" value="${bperson }">
    <input type="hidden" name="bcapacity" value="${bcapacity }">
    <input type="hidden" name="bprice" value="${bprice}">
    <input type="hidden" name="startDate" value="${param.sdate}">
    <input type="hidden" name="endDate" value="${param.edate}">
    <input type="hidden" name="bcheckIn" value="${param.hcheckin}">
    <input type="hidden" name="bcheckOut" value="${param.hcheckout}">
    <input type="hidden" name="id_FK" value="${param.id}">
    <input type="hidden" name="rnum_FK" value="${param.rnum}">

	<!--왼쪽 float -->
    <div id="booking_left">
      <div style="width: 90%; margin-left: 15%; margin-top: 10%;">
 
		<h3>예약자 정보</h3>
			
		예약자명<br>
		&nbsp;<input type="text" name="bname" value="${name }">
<!-- 		<br>@(ajax 이용)회원가입 시 등록된 이름과 예약자명이 다릅니다. 정말 'value'로 예약하시겠습니까?<br> -->
<!-- 		<input type="button" value="예"> -->
<!-- 		<input type="button" value="내 정보의 이름 사용하기"> -->
		<br><br>
		
		휴대폰 번호<br>
		&nbsp;<input type="text" name="bphone" value="${phone }">
<!-- 		<br>@(ajax 이용)회원가입 시 등록된 휴대폰번호와 입력한 휴대폰 번호가 다릅니다. 정말 'value'로 예약하시겠습니까?<br> -->
<!-- 		<input type="button" value="예"> -->
<!-- 		<input type="button" value="내 정보의 전화번호 사용하기"> -->
		<br><br>
		
		<br>		
		<h3>결제 수단 안내</h3>
		<br>
		
		<b>무통장 입금</b>
		<div style="margin-left: 30px; margin-top: 5px">
		  <ul>
		    <li>123-456-789000 요기은행 김요기</li>
		    <li>11-234-5678-990 조기은행 이조기</li>
		    <li>123-45-67890-00 고기은행 박고기</li>
		  </ul>
		</div>
		
		<br><br>
				
		<input type="checkbox" name="checkAll" id="checkAll">전체동의<br>
		&nbsp;<input type="checkbox" name="checkOne" onchange="re(this)">
		숙소 이용 규칙 동의 <b style="color: #ff0000">(필수)</b><br>
		&nbsp;<input type="checkbox" name="checkOne" onchange="re(this)">
		취소/환불규정 동의 <b style="color: #ff0000">(필수)</b><br>
		&nbsp;<input type="checkbox" name="checkOne" onchange="re(this)">
		개인정보 수집 및 이용 동의 <b style="color: #ff0000">(필수)</b><br>
	    
      </div>
    </div>
    
	<!--오른쪽 float -->
    <div id="booking_right">
      <div style="width: 90%; margin-left: 5%; margin-top: 5%;">
		<div>
		  <b>숙소 이름</b><br>
		  <c:out value="${param.hname }"/>
		</div>
		<br>
		
		<div>
		  <b>객실타입</b><br>
		  <c:out value="${param.rtype }"/>		
		</div>
		<br>
		
		<div>
		  <b>기간</b><br>
		  <c:out value="${term }"/>
		</div>
		<br>
		
		<b>인원 / 수용인원(추가 가인원)</b><br>
		<div>
		  <c:out value="${bperson } / ${bcapacity }"/>
		</div>
		<br>
		
		<b>체크인 / 체크아웃</b><br>
		<div>
		  <c:out value="${param.hcheckin } / ${param.hcheckout }"/>
		</div>
		<br><br>		
		
		<div>
		  <b>총 결제 금액(VAT포함)</b>
		  <h3 style="color: #cc0000;">
		    <s style="color: black;"><c:out value="${param.rprice }"/></s>
		    &nbsp;<c:out value="${bprice }(${brate })"/>
		  </h3>
		</div>
		<br>
		
		<div style="margin-left: 8px">
		<ul>
		  <li>해당 객실가는 세금, 봉사료 등이 포함된 금액입니다.</li>
		</ul>
		</div>

      </div>

      <div>
		<input type="submit" id="booking_btn" value="예약하기">
      </div>
    </div>

  </form>
  
</div>

</body>
</html>