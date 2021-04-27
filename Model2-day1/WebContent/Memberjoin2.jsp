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
		<h2 style="text-align: center;">Join</h2><br>
		<form action="Mproc2" method="post">
				<div class="form-group ">
      				<label for="id">아이디</label>
      				<input type="text" class="form-control" id="id" placeholder="ID" name="id">
    			</div>
    			<div class="form-group ">
      				<label for="pass">패스워드</label>
      				<input type="password" class="form-control" id="pass1" placeholder="Password" name="pass">
    			</div>
    			<div class="form-group ">
      				<label for="email">이메일</label>
      				<input type="email" class="form-control" id="email" placeholder="Email" name="email">
    			</div>
    			<div class="form-group ">
      				<label for="tel">전화 번호</label>
      				<input type="tel" class="form-control" id="tel" placeholder="Tel" name="tel">
    			</div>
    			<div class="form-group ">
      				<label for="address">주소</label>
      				<input type="text" class="form-control" id="address" placeholder="address" name="address">
    			</div>
				<input type="submit" class="btn btn-primary btn-block" id="btn_submit" value="회원가입">
				<input type="reset" class="btn btn-primary btn-block" value="다시작성">		
		</form>
		</div>
	</body>
</html>