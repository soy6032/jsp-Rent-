<%@page import="admindb.FrBoardDAO"%>
<%@page import="admindb.AdminRentCarDAO"%>
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
		<jsp:useBean id="bbean" class="admindb.FrBoardBean">
		<jsp:setProperty name="bbean" property="*"/> 
	</jsp:useBean>
	
		<%
		
		
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82104\\Desktop\\학원\\RentCar\\RentCar\\WebContent\\images\\FrBoardImg", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		
	
		bbean.setUserid(multi.getParameter("userid"));
		bbean.setSubject(multi.getParameter("subject"));
		bbean.setContents(multi.getParameter("contents"));
		
		Enumeration<?> files = multi.getFileNames();
	
		String file1 = (String) files.nextElement();
		bbean.setImg(multi.getFilesystemName(file1));
		
	
	
		FrBoardDAO bdao = new FrBoardDAO();
		bdao.insertBoard(bbean);
		
	%>
	완료
	</body>
</html>