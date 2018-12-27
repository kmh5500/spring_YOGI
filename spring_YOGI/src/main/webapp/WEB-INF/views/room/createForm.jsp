<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function inputcheck(f){
	if(f.rtype.value=="선택"){
		alert("타입을 선택하세요");
		f.rtype.focus();
		return false;
	}
	if(f.rprice.value==""){
		alert("방 가격을 입력하세요");
		f.rprice.focus();
		return false;
	}
	if(f.rrate.value==""){
		alert("할인율을 입력하세요");
		f.rrate.focus();
		return false;
	}
	if(f.acperson.value==""){
		alert("수용인원을 입력하세요");
		f.acperson.focus();
		return false;
	}
	if(f.adperson.value==""){
		alert("추가인원을 입력하세요");
		f.adperson.focus();
		return false;
	}
	if(f.fnameMF.value==""){
		alert("사진을 등록하세요");
		f.fnameMF.focus();
		return false;
	}
	if (CKEDITOR.instances['rinfo'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['rinfo'].focus();
	      return false;
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
   CKEDITOR.replace('rinfo');
  };
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<div class="container" >
<h2><span class="glyphicon glyphicon-pencil"></span>등록</h2>
 
<FORM name='frm' method='POST' action='./create'
	onsubmit="return inputcheck(this)"
	enctype="multipart/form-data">
  <TABLE class="table table-bordered">
    
    <TR>
      <TH>방 타입</TH>
      <TD>
      	<select name="rtype">
      		<option value = "선택">선택</option>
      		<option value = "스탠다드룸">스탠다드룸</option>
      		<option value = "패밀리룸">패밀리룸</option>
      		<option value = "디럭스룸">디럭스룸</option>
      		<option value = "스위트룸">스위트룸</option>
      	</select>
      </TD>
    </TR>
    <TR>
      <TH>방 가격</TH>
      <TD><input type="number" min=0 step=100 name="rprice">원</TD>
    </TR>
    <TR>
      <TH>할인율</TH>
      <TD><input style="width:100px" type="number" min=0 max=100 name="rrate">%</TD>
    </TR>
    <TR>
      <TH>수용인원</TH>
      <TD><input style="width:50px" type="number" min=0 name="acperson">명</TD>
    </TR>
    <TR>
      <TH>추가인원</TH>
      <TD><input style="width:50px" type="number" min=0 name="adperson">명</TD>
    </TR>
    <TR>
      <TH>방 사진</TH>
      <TD><input type="file" name="fnameMF" accept=".jpg,.png,.gif"></TD>
    </TR>
    <TR>
      <TH>방 정보</TH>
      <TD><textarea rows="10" cols="45" name="rinfo"></textarea></TD>
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