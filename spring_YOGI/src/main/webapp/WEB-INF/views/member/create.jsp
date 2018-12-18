<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>

<script type="text/javascript">
var idresult ;
var emailresult;
function inputCheck(f){
	
	if(idresult == '1'){
		alert("아이디 중복을 확인해주세요");
		 
		f.id.value = "";
		f.id.focus();
		return false;
		 	
	}
	if(emailresult == '1'){
		alert("이메일 중복을 확인해주세요");
		 
		f.email.value = "";
		f.email.focus();
		return false;
		 	
	}
	
	if(f.id.value==""){
		alert("아이디를 입력해 주세요");
		f.id.focus();
		return false;
	}	
	
	
	if(f.pass.value==""){
		alert("비밀번호를 입력해 주세요");
		f.pass.focus();
		return false;
	}
	if(f.repass.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.repass.focus();
		return false;
	}
	if(f.pass.value!=f.repass.value){
		alert("비밀번호가 일치하지 않습니다. 입력해 주세요");
		f.pass.focus();
		return false;
	}
	if(f.name.value==""){
		alert("이름을 입력해 주세요");
		f.name.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해 주세요");
		f.email.focus();
		return false;
	}
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	var email = f.email.value
	if (!re.test($email)) {
	alert("올바른 이메일 주소를 입력하세요");
	f.email.focus();
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
function checkId() {
    var inputed = $('.id').val();
    console.log(inputed);
    
    var filter = /^[A-Za-z0-9]{4,12}$/;
    if(!filter.test(inputed)){
    	$("#idcheck").text("ID 는 영문숫자  4~12자리 입니다").css("color","red");
    }else{
    $.ajax({
    	
        data : {
            id : inputed
        },
        url : "idCheck",
        success : function(result) {
        	idresult = result;
        	if(inputed=="" && result=="0"){
        	$("#idcheck").text("아이디를 입력해주세요").css("color","red");
        	
        	}else if(result=="1"){
        	$("#idcheck").text("중복된 아이디 입니다.").css("color","red");
        	
        	}else if(result=="0"){
        	$("#idcheck").text("사용 가능합니다").css("color","blue");
        	
        	}else{
        		
        	$("#idcheck").text("오류").css("color","red");
        	
        	}
        },  error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }


    });
    }
}
function checkEmail() {
    var inputed = $('.email').val();
    console.log(inputed);
 

    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!filter.test(inputed)) {
    	$("#emailcheck").text("올바른 이메일 형식이 아닙니다").css("color","red");

    }
    else {

    $.ajax({
    	
        data : {
            email : inputed
        },
        url : "emailCheck",
        success : function(result) {
        	emailresult = result;
        	if(inputed=="" && result=="0"){
        	$("#emailcheck").text("이메일을 입력해주세요").css("color","red");
        	
        	}else if(result=="1"){
        	$("#emailcheck").text("중복된 이메일 입니다.").css("color","red");
        	
        	}else if(result=="0"){
        	$("#emailcheck").text("사용 가능합니다").css("color","blue");
        	
        	}else{
        		
        	$("#emailcheck").text("오류").css("color","red");
        	
        	}
        },  error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }


    });
	}
}


function checkPwd() {
    var inputed = $('.pass').val();
    var reinputed = $('.repass').val();
    console.log(inputed);
    console.log(reinputed);
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
     $("#passcheck").text("비밀번호를 확인해 주세요.").css("color","red");
    } else if (inputed != reinputed) {
     $("#passcheck").text("비밀번호 확인이 일치 하지 않습니다.").css("color","red");
    } else{
     $("#passcheck").text("사용 가능합니다.").css("color","blue");
    	
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
      <TD>
      	  <input type="text" class="form-control id" name="id"  
      	  oninput="checkId()"  >
      	  <span id="idcheck"></span>
       </TD>
       <td>아이디를 적어주세요.</td>
    </TR>
      <TR>
      <TH>*패스워드</TH>
      <TD><input type="password" class="form-control pass" name ="pass" size="15" ></TD>
    	<td>패스워드를 적어주세요.</td>
     </TR>
        <TR>
      <TH>*패스워드 확인</TH>
      <TD><input type="password" class="form-control repass" name="repass" size="15"
      oninput="checkPwd()">
      <span id="passcheck"></span></TD>
      <td>패스워드를 확인합니다.</td>
    </TR>
       <TR>
      <TH>*이름</TH>
      <TD><input type="text" class="form-control" name="name" size="15" ></TD>
    	<td>고객실명을 적어주세요.</td>
    </TR>
    
       <TR>
      <TH>전화번호</TH>
      <TD><input type="text" class="form-control" name="phone" size="15" ></TD>
    	<td></td>
    </TR>
    
       <TR>
      <TH>*이메일</TH>
   	  <TD>
   	  <input type="email" class="form-control email" name="email"  
      	  oninput="checkEmail()" >
           <div id="emailcheck"></div>
      </TD>
      
      <td>이메일을 적어 주세요.</td>
    </TR>

    
  </TABLE>
    
  <DIV class='bottom'>
<!--     <input type='submit' value='회원가입' disabled="disabled" class="form-control btn btn-primary signupbtn"> -->
    <input type='submit' value='회원가입' >
<!--   <button type="submit" class="form-control btn btn-primary signupbtn" disabled="disabled">회원가입</button> -->
    <input type='button' value='취소'>
  </DIV>

</FORM>

  </div>
</body>
</html>