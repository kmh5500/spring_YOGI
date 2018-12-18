<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function inputCheck(f){
	
		
	if(f.oldpass.value==""){
		alert("비밀번호를 입력해 주세요");
		f.oldpass.focus();
		return false;
	}
	if(f.oldpass.value==f.newpass.value){
		alert("기존 비밀번호와 일치합니다.");
		f.newpass.focus();
		return false;
	}
	
	if(f.newpass.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.newpass.focus();
		return false;
	}
	if(f.newpass.value!=f.checknewpass.value){
		alert("신규 비밀번호가 일치하지 않습니다. ");
		f.checknewpass.focus();
		return false;
	}
	
	
	
	
}
</script>
<body>
<div class="container">
	<form name="form1" action="./updatepass"  method="post" 
	onsubmit="return inputCheck(this)">
			

            	<!--// 폼전송시 전달되는 data target element -->
                <section class="">
                    <strong>비밀번호 변경페이지</strong>

                    <div class="">
                        <div></div>
                        <p>${id }</p>
                    </div>

                    <div class="">
                        <div class="">
							<b>기존 비밀번호</b>
							<span class=""></span>
						</div>
                        <section class="">
                            <p class="sec-1">
                                <input type="password" name="oldpass"
                                       placeholder=""
									   data-input="unick"
									   data-msg-required=""
                                       data-rule-minlength="2"
                                       data-rule-spaceChar="true"
                                       data-rule-specialChar="true" />

                            </p>
                        </section>
                        
                        <div class="">
							<b>신규 비밀번호</b>
							<span class=""></span>
						</div>
                        <section class="">
                            <p class="sec-1">
                                <input type="password" name="newpass"
                                       placeholder=""
									   data-input="unick"
									   data-msg-required=""
                                       data-rule-minlength="2"
                                       data-rule-spaceChar="true"
                                       data-rule-specialChar="true" />

                            </p>
                        </section>
                        <div class="">
							<b>신규 비밀번호 확인</b>
							<span class=""></span>
						</div>
                        <section class="">
                            <p class="sec-1">
                                <input type="password" name="checknewpass"
                                       placeholder=""
									   data-input="unick"
									   data-msg-required=""
                                       data-rule-minlength="2"
                                       data-rule-spaceChar="true"
                                       data-rule-specialChar="true" />

                            </p>
                        </section>
						
						<div class="bts-2">
							<button class="submit-btn" type="submit">변경 완료</button>
						</div>

                    </div>
				</section>
			</form>

</div>
</body>
</html>