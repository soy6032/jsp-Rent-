<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	</head>
	<body>
		
		
		<%
		if(session.getAttribute("id") == null || !session.getAttribute("id").equals("admin")){
		%>
				<script>
					alert("권한없음");
					location.href="../RentcarMain.jsp";
				</script>	
		<% 	
		}
		String center = request.getParameter("center");
		if(center == null){
			center = "AdminCenter.jsp";
		}
		%>
		<jsp:include page="AdminTop.jsp" />
		<jsp:include page="<%=center %>" />
		<jsp:include page="AdminBottom.jsp" />
	</body>
</html>