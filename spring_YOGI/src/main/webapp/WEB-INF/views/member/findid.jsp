<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<script type="text/javascript">
function checkEmail() {
    var inputed = $('.email').val();
    console.log(inputed);
 

    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!filter.test(inputed)) {
    	$("#emailcheck").text("올바른 이메일 형식이 아닙니다").css("color","red");
    	  $(".signupbtn").css("background-color", "#aaaaaa");
          $("#checkaa").css("background-color", "#FFCECE");

    }
    else {

    $.ajax({
    	
        data : {
            email : inputed
        },
        url : "emailCheck",
        success : function(result) {
        	if(inputed=="" && result=="0"){
        	$("#emailcheck").text("이메일을 입력해주세요").css("color","red");
        	  $(".signupbtn").css("background-color", "#aaaaaa");
              $("#checkaa").css("background-color", "#FFCECE");
        	
        	}else if(result=="1"){
        	$("#emailcheck").text("위 메일로 전송합니다.").css("color","blue");
        	$(".signupbtn").prop("disabled", false);
            $(".signupbtn").css("background-color", "#4CAF50");
        	
        	}else if(result=="0"){
        	$("#emailcheck").text("존재하지 않는 메일입니다.").css("color","red");
        	  $(".signupbtn").css("background-color", "#aaaaaa");
              $("#checkaa").css("background-color", "#FFCECE");
        	
        	}else{
        		
        	$("#emailcheck").text("오류").css("color","red");
        	  $(".signupbtn").css("background-color", "#aaaaaa");
              $("#checkaa").css("background-color", "#FFCECE");
        	
        	}
        },  error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }


    });
	}
}
</script>
<body>
<div class="container">
<form action="./id" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out">아이디 찾기 폼</legend>
 
        <div class="">
            <label>이메일</label>
	        <input type="email" class="form-control email" name="email"  
			 oninput="checkEmail()" >
	           <div id="emailcheck"></div>
        </div>
    
 
        <div class="box btn">
                <button type="submit" class="form-control btn btn-primary signupbtn" 
                disabled="disabled">이메일 전송</button>
        </div>
    </fieldset>

</form>

</div>

</body>
</html>