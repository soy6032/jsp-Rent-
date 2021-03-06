<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title>Insert title here</title>
		<style type="text/css">
		a{
			color:white;
		}
		ul{
			width: 80%;
		}
		li{
			width:20%;
			text-align: center;
		}
		a:hover {
			color: gray;
		}
		</style>
	</head>
	<body>
		
		<!--세션을 이용한 로그인 처리  -->
		<%
		String id = (String)session.getAttribute("id");
		
		//로그인이 되어있지 않다면
		if(id == null){
			id = "guest";
		}
		
		if(id.equals("admin")){
			id="관리자";
		}
		%>
		
		<br>
		<nav class = "navbar navbar-expand navbar-dark bg-white">
			<div class="container">
				<a href="./AdminMain.jsp" style="color: black; text-decoration: none;">관리자페이지</a>
				<div>
				
	<%
		if(id.equals("guest")){
	%>
	
			<button type="button" class="btn btn-light btn-sm" onclick="location.href='RentcarMain.jsp?center=Memberlogin.jsp'">로그인</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='RentcarMain.jsp?center=Memberjoin.jsp'">회원가입</button>
	<%	
		}
		else{
	%>
			<span style="font-size: 14px;"><%=id %> 님</span>&nbsp;&nbsp;&nbsp;
			<a onclick="return alert('로그아웃되었습니다.')" href="Adminlogout.jsp"  class="btn btn-light btn-sm">로그아웃</a>
	<%
		}
	
		if(session.getAttribute("id")!=null && session.getAttribute("id").equals("admin")){
	%>
			
			&nbsp;&nbsp;&nbsp;
			<a onclick="return alert('홈페이지로 이동합니다.')" href="../RentcarMain.jsp" style="text-decoration: none; color: black;">
			<i class="bi bi-house-door-fill" style="font-size: 20px;" ></i>
			
			</a>
	<%	
		}
	%>
				</div>
				
			</div>
		</nav>
		<br>
		<nav class="navbar navbar-expand-sm justify-content-center top bg-dark">
  			<ul class="navbar-nav">
    			<li class="nav-item">
      				<a class="nav-link" href="AdminMain.jsp?center=MemberView.jsp">회원관리</a>
   				</li>
    			<li class="nav-item">
        			<a class="nav-link" href="AdminMain.jsp?center=CarReserveView.jsp">예약관리</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="AdminMain.jsp?center=AdminCarAllList.jsp">차량관리</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="AdminMain.jsp?center=FrBoardForm.jsp?id=<%= id %>">게시글등록</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="RentcarMain.jsp?center=RentcarNotice.jsp">고객센터</a>
    			</li>
  			</ul>
		</nav>
		
	</body>
</html>