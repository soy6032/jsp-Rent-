<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<%
	String id = (String)session.getAttribute("id");
	%>
	<body>
		<div class="container"style="margin-top: 100px; margin-bottom: 100px;">
  		<h5 style="text-align: center;">자유게시판</h5><br>
  		<form action="FrBoardFormProc.jsp" method="post" enctype="multipart/form-data" name="BoardInserForm">
    	<div class="form-group">
      		제목 : <input type="text" name="subject" class="form-control">
    	</div>
    	<div class="form-group">
      		작성자 : <input type="text" value="<%=id %>" name="userid" class="form-control" readonly>
    	</div>
    	<div class="form-group">
      		이미지 : <input type="file" class="form-control-file border"name="img" id="img">
    	</div>
    	<div class="form-group">
      		내용 : <textarea name="contents" class="form-control" rows="10" ></textarea>
    	</div>
    	<button type="submit" class="btn btn-primary">작성</button>
  	</form>
  	</div>
	</body>
</html>