<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">



	<!-- 상단 메뉴 -->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<!-- 상단 메뉴 끝 -->


	<!-- 내용 시작 -->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>

	<!-- 내용 끝 -->




	<!-- 하단 메뉴 시작 --> 
<%-- 	<tiles:insertAttribute name="footer"> --%>
<%-- 	</tiles:insertAttribute> --%>
 	<!-- 하단 메뉴 끝 -->


</body>
</html>
