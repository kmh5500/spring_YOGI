<%@ page contentType="text/html; charset=UTF-8" %> 
<%    request.setCharacterEncoding("utf-8");
        String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	if(f.rtype.selected==""){
		alert("이름을 입력하세요");
		f.wname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if (CKEDITOR.instances['rinfo'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['rinfo'].focus();
	      return false;
	    }
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
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
	onsubmit="return incheck(this)"
	enctype="multipart/form-data">
  <TABLE class="table table-bordered">
    
    <TR>
      <TH>방 타입</TH>
      <TD>
      	<select name="rtype">
      		<option value = "스탠다드룸">스탠다드룸</option>
      		<option value = "패밀리룸">패밀리룸</option>
      		<option value = "디럭스룸">디럭스룸</option>
      		<option value = "스위트룸">스위트룸</option>
      	</select>
      </TD>
    </TR>
    <TR>
      <TH>방 가격</TH>
      <TD><input type="number" min=0 step=100 name="acperson">원</TD>
    </TR>
    <TR>
      <TH>할인율</TH>
      <TD><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>%</input></TD>
    </TR>
    <TR>
      <TH>수용인원</TH>
      <TD><input type="number" min=0 name="acperson">명</TD>
    </TR>
    <TR>
      <TH>추가인원</TH>
      <TD><input type="number" min=0 name="adperson">명</TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filenameMF"></TD>
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