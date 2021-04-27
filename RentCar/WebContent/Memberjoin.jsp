<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
	function checkLogin(){

		
		var form = document.joinForm
		if(form.id.value == ""){
			alert("아이디를 입력해 주세요");
			form.id.focus();
			return false;
		}
		else if(form.pass1.value == ""){
			alert("비밀번호를 입력해 주세요");
			form.pass1.focus();
			return false;
		}
		else if(form.pass2.value == ""){
			alert("비밀번호 확인을 입력해 주세요");
			form.pass2.focus();
			return false;
		}
		else if(form.pass1.value != form.pass2.value){
			alert("비밀번호를 확인해주세요")
			form.pass1.focus();
			return false;
			}
		else if(form.email.value == ""){
			alert("이메일을 입력해 주세요");
			form.email.focus();
			return false;
		}else if(form.tel.value == ""){
			alert("전화번호를 입력해 주세요");
			form.tel.focus();
			return false;
		}
		form.submit();
	}

	
	

	
	window.addEventListener("DOMContentLoaded", function(){
			var btn = document.getElementById("btn_submit");
			btn.addEventListener("click",function(){
					checkLogin();
			});
	});
</script>
	<body>
		<div class="container col-sm-3" style="margin-top: 100px; margin-bottom: 100px;">
		<h2 style="text-align: center;">Join</h2><br>
		<form action="RentcarMain.jsp?center=MemberJoinProc.jsp" method="post" name="joinForm">
			
				<div class="form-group ">
      				<label for="id">아이디</label>
      				<input type="text" class="form-control" id="id" placeholder="ID" name="id">
    			</div>
    			<div class="form-group ">
      				<label for="pass1">패스워드</label>
      				<input type="password" class="form-control" id="pass1" placeholder="Password" name="pass1">
    			</div>
    			<div class="form-group ">
      				<label for="pass2">패스워드 확인</label>
      				<input type="password" class="form-control" id="pass2" placeholder="Password" name="pass2"> 
    			</div>
    			<div class="form-group ">
      				<label for="email">이메일</label>
      				<input type="email" class="form-control" id="email" placeholder="Email" name="email">
    			</div>
    			<div class="form-group ">
      				<label for="tel">전화 번호</label>
      				<input type="tel" class="form-control" id="tel" placeholder="Tel" name="tel">
    			</div>
				<input type="button" class="btn btn-primary btn-block" id="btn_submit" value="회원가입">
				<input type="reset" class="btn btn-primary btn-block" value="다시작성">			
					
					
		</form>
		</div>
	</body>
</html>