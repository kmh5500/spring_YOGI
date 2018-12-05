<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
function inputCheck(f){
	if(f.id.value==""){
		alert("이이디를 입력해 주세요");
		f.id.focus();
		return false;
	}	
	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다. 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	if(f.mname.value==""){
		alert("이름을 입력해 주세요");
		f.mname.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해 주세요");
		f.email.focus();
		return false;
	}
	
 
}
</script>
<body>
<div class="container">
  <span class="glyphicon glyphicon-pencil"></span>
<h2>회원가입</h2>
 
<FORM name='frm' method='POST' action='./create'
		enctype="multipart/form-data"
		onsubmit="return inputCheck(this)">
		<input type="hidden" name="grade"	value="${param.grade }">
  <TABLE class="table table-bordered">
    
      <TR>
      <TH>*아이디</TH>
      <TD><input type="text" name="id" size="15" >
      	  <input type="button" value="ID중복확인"
      	  		onclick="idCheck(document.frm.id.value)">
      	  		<span id="idcheck"></span>
       </TD>
       <td>아이디를 적어주세요.</td>
    </TR>
      <TR>
      <TH>*패스워드</TH>
      <TD><input type="password" name ="pass" size="15" ></TD>
    	<td>패스워드를 적어주세요.</td>
     </TR>
        <TR>
      <TH>*패스워드 확인</TH>
      <TD><input type="password" name="repasswd" size="15"></TD>
      <td>패스워드를 확인합니다.</td>
    </TR>
       <TR>
      <TH>*이름</TH>
      <TD><input type="text" name="name" size="15" ></TD>
    	<td>고객실명을 적어주세요.</td>
    </TR>
    
       <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="phone" size="15" ></TD>
    	<td></td>
    </TR>
    
       <TR>
      <TH>*이메일</TH>
   	  <TD><input type="text" name="email" size="25">
      <input type="button" value="Email중복확인"
      onclick="emailCheck(document.frm.email.value)">
      <div id="emailCheck"></div>
      </TD>
      
      <td>이메일을 적어 주세요.</td>
    </TR>

    
  </TABLE>
    
  <DIV class='bottom'>
    <input type='submit' value='회원가입'>
    <input type='button' value='취소'>
  </DIV>

</FORM>

  </div>
</body>
</html>