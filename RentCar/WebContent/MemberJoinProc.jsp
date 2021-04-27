<%@page import="db.MemberDAO"%>
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
		request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="mbean" class="db.MemberBean">
			<jsp:setProperty name="mbean" property="*"/>
		</jsp:useBean>
		<%
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean); 
		%>
		<div class="container col-sm-3"style="margin-top: 100px; margin-bottom: 100px;">
  			<h4 style="text-align: center;">회원가입 되었습니다.</h4><br><br>
    		<button class="btn btn-primary btn-block" onclick="location.href='RentcarMain.jsp?center=Memberlogin.jsp'">로그인</button>
    	</div>
	</body>
</html>