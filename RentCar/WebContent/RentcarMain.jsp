<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		<title>Insert title here</title>
	</head>
	<body>
		
		<%
		String center = request.getParameter("center");
		if(center == null){
			center = "Center.jsp";
		}
		%>
		<jsp:include page="Top.jsp" />
		<jsp:include page="<%=center %>" />
		<br>
		<jsp:include page="Bottom.jsp" />
		
	</body>
</html>