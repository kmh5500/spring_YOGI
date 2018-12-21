<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
var emailresult;
function emailCheck(f){
	
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if(emailresult == '1'){
		alert("이메일 중복을 확인해주세요");
		 
		f.email.value = "";
		f.email.focus();
		return false;
		 	
	}
	if(f.email.value==""){
		alert("이메일을 입력해 주세요");
		f.email.focus();
		return false;
	}
	if (!re.test(f.email.value)) {
	alert("올바른 이메일 주소를 입력하세요");
	f.email.focus();
	return false;
	}
	
}
function nameCheck(f){
	if(f.name.value==""){
		alert("이름을 입력해 주세요");
		f.name.focus();
		return false;
	}
}

function phonecheck(f){
	var numcheck=/^[0-9]{9,11}$/;
	if(f.phone.value==""){
		alert("핸드폰 번호를 입력해 주세요");
		f.phone.focus();
		return false;
	}
	if(!numcheck.test(f.phone.value)){
		alert("올바른 핸드폰 번호가 아닙니다");
		
		f.phone.focus();
	
		return false;
		
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



$(function(){
	$(".sec-1").hide();
	$(".bts-2").hide();
	
	 $(".bts-1").click(function(){
		 $(".sec-1").show();
		 $(".bts-2").show();
		 $(".bts-1").hide();
		 
	  });
	 
	
	 $(".cancel-btn").click(function(){
			$(".sec-1").hide();
			$(".bts-2").hide();
			 $(".bts-1").show();
		 
	  });
	 
	});
$(function(){
	$(".sec-3").hide();
	$(".bts-4").hide();
	
	 $(".bts-3").click(function(){
		 $(".sec-3").show();
		 $(".bts-4").show();
		 $(".bts-3").hide();
		 
	  });
	 
	
	 $(".cancel-btn3").click(function(){
			$(".sec-3").hide();
			$(".bts-4").hide();
			 $(".bts-3").show();
		 
	  });
	 
	});
$(function(){
	$(".sec-5").hide();
	$(".bts-6").hide();
	
	 $(".bts-5").click(function(){
		 $(".sec-5").show();
		 $(".bts-6").show();
		 $(".bts-5").hide();
		 
	  });
	 
	
	 $(".cancel-btn5").click(function(){
			$(".sec-5").hide();
			$(".bts-6").hide();
			 $(".bts-5").show();
		 
	  });
	 
	});


</script>

</head>


<body>

<div>
 <div class="container">
        <div class="">
			<form name="form1" action="./update"  method="post"
			onsubmit="return emailCheck(this)" >
				<!-- 폼전송시 전달되는 data target element -->
				<div class="" >
					
					<input type="hidden" name="name"  value="${dto.name }" />
					<input type="hidden"  name="phone" value="${dto.phone }" />
					
				</div>

            	<!--// 폼전송시 전달되는 data target element -->
                <section class="">
                    <strong>내 정보 수정</strong>

                    <div class="">
                        <div></div>
                        <p>${dto.id }</p>
                    </div>

                    <div class="">
                        <div class="">
							<b>이메일</b>
							<span class="">${dto.email }</span>
						</div>
                        <section class="">
                            <p class="sec-1">
                            
                                <input type="text" name="email" class="email"
                                       placeholder="체크인시 필요한 정보입니다."
									   data-input="unick"
									   oninput="checkEmail()"
									  />

                       		 <p id="emailcheck"></p>
                       		 </p>
                            
                        </section>
						<div class="bts-1">
							<button class="edit-btn" type="button">수정</button>
						</div>
						<div class="bts-2">
							<button class="submit-btn" type="submit">수정완료</button>
							<button class="cancel-btn" type="button">수정취소</button>
						</div>
                    </div>
				</section>
			</form>
			<form name="form2" action="./update" autocomplete="off" method="post"
			 novalidate data-form="uname"
			 onsubmit="return nameCheck(this)">
				<!-- 폼전송시 전달되는 data target element -->
				<div class="mypageForm__form-inputs-wrap" >
					<input type="hidden" name="email"  value="${dto.email }" />
					<input type="hidden"  name="phone" value="${dto.phone }" />
				</div>
				<section class="top_area">
                    <div class="pw_input">
						<div class="pw_input__title">
							<b>이름</b>
							<span class="title__uinfo">${dto.name }</span>
						</div>
						<section class="modifying-section">
							<p class="sec-3">
								<input type="text" name="name"
									   
									   placeholder="체크인시 필요한 정보입니다."
									   data-input="uname"
									   data-rule-spaceChar="true"
									   data-rule-specialChar="true"/>
							</p>
						</section>
						<div class="bts-3">
							<button class="edit-btn" type="button">수정</button>
						</div>
						<div class="bts-4">
							<button class="submit-btn" type="submit">수정완료</button>
							<button class="cancel-btn3" type="button">수정취소</button>
						</div>
                    </div>
				</section>
			</form>

			<form  name="form3" action="./update" autocomplete="off" method="post" 
			novalidate data-form="uphone"
			onsubmit="return phonecheck(this)">
				<section>
					<!-- 폼전송시 전달되는 data target element -->
					<div class="mypageForm__form-inputs-wrap">
					<input type="hidden" name="email"  value="${dto.email }" />
					<input type="hidden" name="name"  value="${dto.name }" />
					</div>

					
                    <div class="pw_input phone_confirm">
						<div class="pw_input__title">
							<b>휴대폰 번호</b>
							<span class="title__uinfo">${dto.phone }</span>
							<div class="safety_txt">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
						</div>
						<div class="modifying-section">
							<div id="sendCode">
								<section>
									<div class="sec-5">
										<input type="tel" name="phone" 
											   placeholder="'-'없이 등록  01012341234"
											   minlength="9"
											   maxlength="11"
											   data-input="uphone"
											   data-msg-required=""
											   data-rule-phonenumber="true">
									</div>

								</section>

							</div>
							
						</div>
						<div class="bts-5">
							<button class="edit-btn" type="button">수정</button>
						</div>
						<div class="bts-6">
							<button class="submit-btn" type="submit">수정완료</button>
							<button class="cancel-btn5" type="button">수정취소</button>
						</div>
                    </div>
                </section>
			</form>
               <!-- <button class="btn_red_fill btn_one" type="submit">저장</button>-->

             <p class="bot_link"><a href="./updatepass">비밀번호 변경</a> &gt;</p>
                        </div>

        <div class="bot_btn">
            <p>여기어때를 이용하고 싶지 않으신가요?</p>
            <button type="button" onclick="location.href='./delete'" type="button">회원탈퇴</button>

        </div>
    </div>
</div>
<!-- //Content  -->



 
</body>
</html>