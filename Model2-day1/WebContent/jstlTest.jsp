<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 변수 선언  -->
		<c:set var="i" value="4"/>  <!-- request.setAttribute("i", 4) 와 동일  -->
		<!-- if문 사용 -->
		<c:if test="${i > 3 }">
			안녕하세요<br>
		</c:if>
		<!-- 반복문 -->
		<c:forEach var="a" begin="1" end="10" step="${a = a + 1 }">
			점심시간입니다. ${a} <br>
		</c:forEach>
	</body>
</html>