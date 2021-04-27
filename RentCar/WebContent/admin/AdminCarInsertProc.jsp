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
	
	<jsp:useBean id="cbean" class="db.CarListBean">
		<jsp:setProperty name="cbean" property="*"/> 
	</jsp:useBean>
	
		<%
		
		/* 내장 객체 request에 의해서 전송된 파일 데이터를 저장하기 위한 외부 라이브러리 클래스 */
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82104\\Desktop\\학원\\RentCar\\RentCar\\WebContent\\images", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		
		/* String name = multi.getParameter("name");
		int categoty = Integer.parseInt(multi.getParameter("categoty"));
		int price = Integer.parseInt(multi.getParameter("price"));
		int usepeople = Integer.parseInt(multi.getParameter("usepeople"));
		String company = multi.getParameter("company");
		String info = multi.getParameter("info"); */
	
		cbean.setName(multi.getParameter("name"));
		cbean.setCategory(Integer.parseInt(multi.getParameter("categoty")));
		cbean.setPrice(Integer.parseInt(multi.getParameter("price")));
		cbean.setUsepeople(Integer.parseInt(multi.getParameter("usepeople")));
		cbean.setCompany(multi.getParameter("company"));
		cbean.setInfo(multi.getParameter("info"));
		
		/* request 내장 객체에 저장된 파일명 모두 불러오기 */
		Enumeration<?> files = multi.getFileNames();
	
		/* Enumeration 클래스의 객체 files에 저장된 순서가 거꾸로임 */
		
		String file1 = (String) files.nextElement();
		/* String img = multi.getFilesystemName(file1); */
		cbean.setImg(multi.getFilesystemName(file1));
		
	
	
		AdminRentCarDAO cdao = new AdminRentCarDAO();
		cdao.insertCar(cbean);
		
		response.sendRedirect("AdminMain.jsp?center=AdminCarAllList.jsp");
	%>
	
	
	</body>
</html>