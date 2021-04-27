<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		int reserveno = Integer.parseInt(request.getParameter("reserveno"));
		
		RentcarDAO rdao = new RentcarDAO();
		//예약삭제메소드호출
		rdao.carRemoveReserve(reserveno); 
		
		response.sendRedirect("./AdminMain.jsp?center=CarReserveView.jsp");
		%>
	</body>
</html>