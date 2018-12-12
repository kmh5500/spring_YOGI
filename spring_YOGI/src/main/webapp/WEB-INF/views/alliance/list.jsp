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
</style>
<body>
<table>
<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()"
  class="w3-bar-item w3-button">Close Menu</a>
  <a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">Food</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
</nav>

<!-- Top menu -->
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
    <div class="w3-right w3-padding-16">Mail</div>
    <div class="w3-center w3-padding-16">My Food</div>
  </div>
</div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="${root }/images/hotel5.jpg" alt="Sandwich" style="width:100%">
      <h3>지금 할인 중인 호텔♥</h3>
      <p>할인 중인 적국 184개 호텔을 한눈에!</p>
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


	</table>

	


</body>
</html>