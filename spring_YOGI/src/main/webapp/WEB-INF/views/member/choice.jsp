<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/ssi/ssi.jsp"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.member_register_wrap .align {display:inline-block; *display:inline; zoom:1; margin-top:30px;}

.member_register_wrap img { width:50%; height:auto}

.member_register_wrap .ex_text{color:#242424; line-height:180%;}

.member_register_wrap .bt_text {padding-top:10px; color:#fff;  }

.member_register_wrap:after{clear:both; content:""; display:block;}

.member_register_basic, .member_register_dealer {margin:0 auto; float:left; width:150px; padding:30px; display:inline-block;}

.member_register_basic {background-color:#0431b4; margin-right:20px;}

.member_register_dealer {background-color:#002286;}
.member_register_wrap{width:100%; margin:auto; text-align:center; color:#fff; overflow: hidden;}

.member_register_wrap a{color:#fff; text-decoration:none;}

 form{display:inline}


</style>
</head>

<script type="text/javascript">
function create(grade){
	var url = "./create";
	url = url + "?grade="+grade;
	
	location.href = url;
}
</script>
<body>
<div class="member_register_wrap">

<p class="ex_text"><strong>일반회원/딜러회원</strong> 종류에 따라 회원가입 절차가 다릅니다.<br />

고객님이 해당하는 회원 종류를 선택해주세요.</p>

		<div class="align">

	
		<a href="javascript:create('P')">

		<div class="member_register_basic">

		<p><img src="${pageContext.request.contextPath }/images/h.png"  alt="일반 회원"></p>

		<p class="bt_text">일반 회원</p>

		</div>
		</a>
		
		
		<a href="javascript:create('H')">

		<div class="member_register_basic">

		<p><img src="${pageContext.request.contextPath }/images/h.png"  alt="호텔 회원"></p>

		<p class="bt_text">호텔 회원</p>

		</div>
		</a>


		<a href="javascript:create('A')">

		<div class="member_register_basic">

		<p><img src="${pageContext.request.contextPath }/images/h.png"  alt="제휴 회원"></p>

		<p class="bt_text">제휴 회원</p>

		</div>
		</a>
	
	</div>

</div>
</body>
</html>