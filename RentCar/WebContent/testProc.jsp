<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
	/* 내장 객체 request에 의해서 전송된 파일 데이터를 저장하기 위한 외부 라이브러리 클래스 */
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82104\\Desktop\\학원\\RentCar\\RentCar\\WebContent\\images", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		
	String name1 = multi.getParameter("name1");
	String subject1 = multi.getParameter("subject1");
	
	
	
	/* request 내장 객체에 저장된 파일명 모두 불러오기 */
	Enumeration<?> files = multi.getFileNames();
	
	/* Enumeration 클래스의 객체 files에 저장된 순서가 거꾸로임 */
	
	
	String file1 = (String) files.nextElement();
	String filename1 = multi.getFilesystemName(file1);
	%>
	
	<table border=1>
		<thead>
			<tr>
				<th width="100">이름</th>
				<th width="100">제목</th>
				<th width="100">파일</th>
			</tr>
		</thead>
		<tbody>
			<%
			out.print("<tr><td>" + name1 + "</td>");
			out.print("<td>" + subject1 + "</td>");
			out.println("<td>" + filename1 + "</td></tr>\n");
			
		
			%>
		</tbody>
	</table>
	</body>
</html>