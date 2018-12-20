<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}

.search {
	width: 80%;
	text-align: center;
	margin: 2px auto;
}
</style>
<script type="text/javascript">
	function aread(anum) {
		var url = "read";
		url = url + "?anum=" + anum;
		location.href = url;
	}
</script>
<body>
<div class="search">
		<form action="./list" method="post">
			<select name="col">
				
				<option value="hname">호텔이름</option>
			</select> <input type="text" name="word" value="${word}">
			<button>검색</button>
			<button type="button" onclick="location.href='create'">등록</button>
		</form>
	</div>

<table>

  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	
  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="${root }/images/hotel5.jpg" alt="Sandwich" style="width:100%">
      <h3>지금 할인 중인 호텔♥</h3>
      <p>할인 중인 전국 184개 호텔을 한눈에!</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel6.jpg" alt="Steak" style="width:100%">
      <h3>연인과 함께하는 이색데이트!</h3>
      <p>피로가 한번에 풀리는 스파/월풀 모텔 모음</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel7.jpg" alt="Cherries" style="width:100%">
      <h3>내주변 숙소 즉시 할인 중!</h3>
      <p>야놀자 프라이빗딜!최대 1만원 즉시 할인</p>
      
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel8.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>야놀자호텔X클럽 옥타곤</h3>
      <p>클럽 옥타곤 입장권+웰컴드링크 무료 제공</p>
    </div>
  </div>

  
  <!-- Second Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="${root }/images/hotel1.jpg" alt="hotel1" style="width:100%">
      <h3>[서울]포인트x2배 적립 숙소</h3>
      <p>기본 적립금+추가 적립금 두배 혜택!</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel2.jpg" alt="hotel2" style="width:100%">
      <h3>느긋한 힐링,스파펜션</h3>
      <p>히노끼스파?제트스파? 취향 따라가자!</p> 
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel3.jpg" alt="Sandwich" style="width:100%">
      <h3>지금 할인 중인 펜션♥</h3>
      <p>선착순 쿠폰으로 여행경비 세이브!</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel4.jpg" alt="Croissant" style="width:100%">
      <h3>연말엔 역시 단체 파티룸!</h3>
      <p>우리끼리 밤새 놀기 좋은 파티룸 숙소 모음</p>
    </div>
  </div>
  
  
  
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="${root }/images/hotel20.jpg" alt="hotel20" style="width:100%">
      <h3>주말 숙박 2만원</h3>
      <p>단독 초특가! 미리예약 하면 주말 숙박 2만원</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel21.jpg" alt="hotel21" style="width:100%">
      <h3>만인의 로망,폭층 펜션!</h3>
      <p>공간 활용도 최고! 가성비 최고!</p> 
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel22.jpg" alt="Sandwich" style="width:100%">
      <h3>지금 할인 중인 모텔♥</h3>
      <p>최대20% 즉시할인에 선착순 쿠폰까지!</p>
    </div>
    <div class="w3-quarter">
      <img src="${root }/images/hotel23.jpg" alt="Croissant" style="width:100%">
      <h3>♥무한대실 이벤트♥</h3>
      <p>추운 겨울,최대 12시간 대실 데이트 하자~!</p>
    </div>
  </div>


	</table>
<div class="search">
		<form action="./list" method="post">
<!-- 			<select name="col"> -->
<%-- 				<option value="No" <c:if test="${col=='no'}">selected</c:if>>No</option> --%>
<%-- 				<option value="title" <c:if test="${col=='title'}">selected</c:if>>제목</option> --%>
<!-- 				<option value="total">전체</option> -->
<%-- 			</select> <input type="text" name="word" value="${word}"> --%>
			
		</form>
	</div>

	<DIV class="container">
		<h2>목록</h2>

		<TABLE class="table table-hover">
		
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="8">등록된 글이 없습니다.</td>
					</tr>
				</c:when>


				<c:otherwise>
					<c:forEach var="dto" items="${list}" varStatus="status">
	
	
    <div class="w3-quarter">
      <img src="${root }/alliance/storage/${dto.fname}"  style="width:100%">
      <h3>${dto.aname}</h3>
      <p>${dto.content}</p>
    </div>
    		
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</TABLE>
		<DIV class='bottom'>${paging}</DIV>
	</DIV>

	


</body>
</html>