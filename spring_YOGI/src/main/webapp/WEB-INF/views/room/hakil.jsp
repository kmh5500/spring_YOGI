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
	 cursor:pointer;
}
#booking_left {
	 float: left; 
	 width: 50%; 
	 margin-bottom: 10%;
}
#booking_right {
	 float: right; 
	 width: 45%; 
	 background-color: #f0eef0; 
	 margin-top: 5%; 
	 margin-bottom: 10%;
}
</style>

<script type="text/javascript">
function booking(f) {
	if(f.name.value == "") {
		alert("예약자명을 입력해주세요.");
		f.name.focus();
	}
	if(f.phone.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		f.phone.focus();
	}
	if(f.name.value == "") {
		alert("예약자명을 입력해주세요.");
		f.name.focus();
	}
	
	
	f.submit();
}
</script>

</head>
<body>

<div class="clearfix">

  <h2></h2>

  <form action="create">

    <div id="booking_left">
      <div style="width: 90%; margin-left: 5%; margin-top: 10%;">
 
		<h3>예약자 정보</h3>
			
		예약자명<br>
		&nbsp;<input type="text" name="name" value="@내 정보의 이름">
		<br>@(ajax 이용)회원가입 시 등록된 이름과 예약자명이 다릅니다. 정말 'value'로 예약하시겠습니까?<br>
		<input type="button" value="예">
		<input type="button" value="내 정보의 이름 사용하기">
		<br><br><br>
		
		휴대폰 번호<br>
		&nbsp;<input type="text" name="name" value="@내 정보의 전화번호">
		<br>@(ajax 이용)회원가입 시 등록된 휴대폰번호와 입력한 휴대폰 번호가 다릅니다. 정말 'value'로 예약하시겠습니까?<br>
		<input type="button" value="예">
		<input type="button" value="내 정보의 전화번호 사용하기">
		<br><br><br>
		
		<hr>
		
		<br>
		
		<h3>결제 수단 안내</h3>
		<br>
		
		<b>무통장 입금</b>
		<ul>
		  <li>123-456-789000 요기은행 김요기</li>
		  <li>11-234-5678-990 조기은행 이조기</li>
		  <li>123-45-67890-00 고기은행 박고기</li>
		</ul>
		
		<br>
		<hr>
		
		<br>
		
		<input type="checkbox">전체동의<br>
		&nbsp;<input type="checkbox">숙소 이용 규칙 동의 <b style="color: #ff0000">(필수)</b><br>
		&nbsp;<input type="checkbox">취소/환불규정 동의 <b style="color: #ff0000">(필수)</b><br>
		&nbsp;<input type="checkbox">개인정보 수집 및 이용 동의 <b style="color: #ff0000">(필수)</b><br>
	    
      </div>
    </div>
    
    <div id="booking_right">
      <div style="width: 90%; margin-left: 5%; margin-top: 5%;">
		<h2>@여기는 ajax 이용 (회원의 선택에 따라 값이 그 자리에서 바로 변경)@</h2>
		<b>숙소 이름</b><br><br>
		@호텔이름
		<br><br><br>
		
		<b>객실타입/기간</b><br><br>
		@객실정보 / 기간 &nbsp;
		<select>
		 <option>객실 변경</option>
		 <option>@빈방정보</option>
		</select>
		<br><br><br>
		
		<b>체크인</b><br><br>
		@객실 규정 체크인 시간<br>
		(테이블 저장 정보만 끌어오기)
		<br><br><br>
		
		<b>체크아웃</b><br><br>
		@객실 규정 체크아웃 시간<br>
		(테이블 저장 정보만 끌어오기)
		<br><br><br>
		
		<hr>
		
		<br><br>
		<b>총 결제 금액(VAT포함)</b><br>
		
		<h3 style="color: #cc0000;">@총 결제 금액</h3>
		
		<ul>
		 <li>해당 객실가는 세금, 청소료, 봉사료 등이 포함된 금액입니다.</li>
		</ul>

      </div>

      <div onclick="booking(this.form)" id="booking_btn">
		<h3>예약하기</h3>
      </div>
    </div>

  </form>
  
</div>

</body>
</html>