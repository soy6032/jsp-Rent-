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
	
	
	<div class="container col-sm-3" style="margin-top: 100px; margin-bottom: 100px;">
  <h2 style="text-align: center;">Login</h2><br>
  <form action="MemberLoginProc.jsp" method="post" >
  	<div class="form-group ">
      <label for="id">아이디</label>
      <input type="text" class="form-control" id="id" placeholder="ID" name="id">
    </div>
    <div class="form-group">
      <label for="pass">패스워드</label>
      <input type="password" class="form-control" id="pass" placeholder="Password" name="pass">
    </div>
    <button type="submit" class="btn btn-primary btn-block">Login</button>
  </form>
</div>
	</body>
</html>