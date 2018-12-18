<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script src = "http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function inputCheck(f){
	if(f.hname.value==""){
		alert("호텔명을 입력해 주세요");
		f.hname.focus();
		return false;
	}
	if(f.hphone.value==""){
		alert("전화번호를 입력해 주세요");
		f.hphone.focus();
		return false;
	}
	if(f.hmail.value==""){
		alert("이메일을 입력해 주세요");
		f.hemail.focus();
		return false;
	}
	if(f.hzipcode.value==""){
		alert("우편번호를 입력해 주세요");
		f.hzipcode.focus();
		return false;
	}
	if(f.haddress1.value==""){
		alert("주소를 입력해 주세요");
		f.haddress1.focus();
		return false;
	}
	if(f.haddress2.value==""){
		alert("상세주소를 입력해 주세요");
		f.haddress2.focus();
		return false;
	}
	if(f.hfname.value==""){
		alert("사진을 등록해 주세요");
		f.hfname.focus();
		return false;
	}
	if(f.hcheckin.value==""){
		alert("체크인 시간을 입력해 주세요");
		f.hcheckin.focus();
		return false;
	}
	if(f.hcheckout.value==""){
		alert("체크아웃 시간을 입력해 주세요");
		f.hcheckout.focus();
		return false;
	}
	
	if (CKEDITOR.instances['rinfo'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['rinfo'].focus();
	      return false;
	    }
}

$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});

function hnameCheck(hname){
	if(hname==""){
		alert("호텔명을 입력해 주세요");
		document.frm.hname.focus();
	}else{
		var url = "hnameCheck";
		
		$.ajax({
			url : url,
			type : "GET",
			dataType : 'text',
			data : {"hname" : hname},
			success : function(data){
				$("#hnamecheck").text(data.trim()).css("color","red");
			}
		});
	}
}

function hemailCheck(hemail){
	if(hemail==""){
		alert("이메일을 입력해 주세요");
		document.frm.hemail.focus();
	}else{
		var url = "hemailCheck";
		
		$.ajax({
			url:url,
			type : "GET",
			dataType:'text',
			data:{"hemail":hemail},
			success:function(data){
				$("#hemailcheck").text(data.trim()).css("color","red");
			}
		});
	}
}

</script>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('hinfo');
  };
</script>
</head> 
<body>
<div class="container" >
<h2><span class="glyphicon glyphicon-pencil"></span>호텔 등록</h2>
 
<FORM name='frm' method='POST' action='./createProc'
	onsubmit="return inputCheck(this)"
	enctype="multipart/form-data">
  <TABLE class="table table-bordered">    
    <TR>
      <TH>호텔명</TH>
      <TD><input type="text" name="hname" size="15">
      <input type="button" value="호텔명 중복확인"
      			onclick="hnameCheck(document.frm.hname.value)">
      		<span id="hnamecheck"></span>	
      </TD>
      <td>호텔명을 적어주세요.</td>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD colspan=2><input type="text" name="hphone" size="15"></TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="hemail" size="25">
      <input type="button" value="이메일 중복확인"
      			onclick="hemailCheck(document.frm.hemail.value)">
      		<span id="hemailcheck"></span>	
      </TD>
      <td>이메일을 적어주세요.</td>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD colspan=2><input type="text" name="hzipcode" size="7" id="sample6_postcode"
      		placeholder="우편번호">
      	<input type="button" value="우편번호찾기" onclick="sample6_execDaumPostcode()">
      	</TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD colspan=2><input type="text" name="haddress1" size="40" id="sample6_address"
      		placeholder="주소"><br>
      	  <input type="text" name="haddress2" size="40" id="sample6_address2"
      		placeholder="상세주소">
      </TD>
    </TR>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fnameMF" accept=".jpg,.png,.gif"></TD>
      <td style="width: 263px; ">사진은 JPG, PNG, GIF파일만 올려주세요.</td>
    </TR>
    <tr>
    	<th>체크인</th>
    	<td colspan=2><input type="text" name="hcheckin" size="15" placeholder="ex)12:00">
    </tr>
    <tr>
    	<th>체크아웃</th>
    	<td colspan=2><input type="text" name="hcheckout" size="15" placeholder="ex)14:00">
    </tr>
    <TR>
      <TH>방 정보</TH>
      <TD colspan=2><textarea rows="10" cols="45" name="hinfo"></textarea></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 </div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>