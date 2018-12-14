<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
  <link rel="stylesheet" type="text/css" href="${root }/jquery/jquery-ui.css">
  <script type="text/javascript" src="${root }/jquery/jquery.js"></script>
  <script type="text/javascript" src="${root }/jquery/jquery-ui.js"></script>
  <script type="text/javascript">
  $( function() {
	  var dateFormat = "mm/dd/yy",
      sdate = $( "#sdate" )
        .datepicker({
         defaultDate: "+1w",
         changeMonth: true,
         numberOfMonths: 1
        })
        .on( "change", function() {
          edate.datepicker( "option", "minDate", getDate( this ) );
        }),
      edate = $( "#edate" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
        })
        .on( "change", function() {
          sdate.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  
  
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500000,
      values: [ 0, 500000 ],
      slide: function( event, ui ) {
        $( "#price" ).html( ui.values[ 0 ] + "원 ~ " + ui.values[ 1 ] + "원" );
		$( "#srprice" ).val(ui.values[ 0 ]);
		$( "#erprice" ).val(ui.values[ 1 ]);
      }
    });
    $( "#price" ).html(  $( "#slider-range" ).slider( "values", 0 ) +
     "원 ~ " + $( "#slider-range" ).slider( "values", 1 ) + "원");
  });
  </script>
<body>
<div class="clearfix">
<form name="frm" method="post" action="./list">

<div style="float: left; width: 30%; background-color: #f0eef0; margin-left: 5%; margin-top: 5%; margin-bottom: 10%;">

 <div style="width: 90%; margin-left: 5%; margin-top: 5%;">
 
	<h2>검색조건</h2>

	<br><br><br>
	<b>날짜</b><br><br>
	<label for="sdate">체크인</label>
	<input type="text" id="sdate" name="sdate" value="${sdate }">
	<br><br>
	<label for="edate">체크아웃</label>
	<input type="text" id="edate" name="edate" value="${edate }">
	<br><br><br>
	
	<b>방 타입</b><br><br>
	<select name="type">
	 <option>선택</option>
	 <option value="스탠다드룸"
	<c:if test="${type=='스탠다드룸' }">selected</c:if>
	>스탠다드룸</option>
	 <option value="패밀리룸"
	<c:if test="${type=='패밀리룸' }">selected</c:if>
	>패밀리룸</option>
	 <option value="디럭스룸"
	<c:if test="${type=='디럭스룸' }">selected</c:if>
	>디럭스룸</option>
	 <option value="스위트룸"
	<c:if test="${type=='스위트룸' }">selected</c:if>
	>스위트룸</option>
	</select>
	<br><br><br>
	
	<b>인원수</b><br><br>
	<input type="number" name="rperson" min=0 style="width:50px" value="${rperson }">명</input>
	<br><br><br>
	
	
	<b>가격</b><br><br>
	<p id="price">
 	<div style="width:300px" id="slider-range"></div>
    <input type="hidden" id="srprice" value = "0" name="srprice">
    <input type="hidden" id="erprice" value="500000" name="erprice">
	
	<br><br><br>
	
	<hr>
	
	<br><br>

 </div>

 <input type="submit" value="검색하기" style="text-align: center; font-size:30px; width:100%; padding: 2% 0%; background-color: #cc0000; cursor:pointer;">
 
 </div>
 

<div style="float: right; width: 65%; margin-bottom: 10%;">
 <div style="width: 90%; margin-left: 5%; margin-top: 10%;">
 
	<h3>방 리스트</h3>
	
		<c:choose>
    	<c:when test="${empty list}">
			<h1>해당 검색내역이 없습니다.</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<div>
					<img src='${root }/room/storage/${dto.rfname}' width="200px" heigh = "200px">
					<p>${dto.rtype }</p>
					<p>${dto.rprice }</p>
					<p>${dto.rrate }</p>
					<p>${dto.rfname }</p>
					<p>${dto.hdto.hname }</p>
					<p>${dto.hdto.hstar }</p>
					
				</div>
			
			</c:forEach>
		</c:otherwise>
		</c:choose>
	
	
	
	
	
	<div class='bottom'>
    	${paging}
  	</div>
 </div>
</div>




</form>
</div>
</body>
</html>