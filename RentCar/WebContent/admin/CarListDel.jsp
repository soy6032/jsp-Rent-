<%@page import="admindb.AdminRentCarDAO"%>
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
		int no = Integer.parseInt(request.getParameter("no"));
		
		AdminRentCarDAO adao = new AdminRentCarDAO();
		adao.carListDelete(no); 
		
		response.sendRedirect("./AdminMain.jsp?center=AdminCarAllList.jsp");
		%>
	</body>
</html>