<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="testProc.jsp" method="post" enctype="multipart/form-data" name="fileForm">
		<label for="name1">이 름1 : </label>
		<input type="text" name="name1" id="name1"><br>
		<label for="subject1">제 목1 : </label>
		<input type="text" name="subject1" id="subject1"><br>
		<label for="filename1">파 일1 : </label>
		<input type="file" name="filename1" id="filename1"><br><br>
		<button type="submit">파일 업로드</button>
		</form>
	</body>
</html>