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
		
		
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82104\\Desktop\\학원\\RentCar\\RentCar\\WebContent\\images", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		cbean.setNo(Integer.parseInt(multi.getParameter("no")));
		cbean.setName(multi.getParameter("name"));
		cbean.setCategory(Integer.parseInt(multi.getParameter("categoty")));
		cbean.setPrice(Integer.parseInt(multi.getParameter("price")));
		cbean.setUsepeople(Integer.parseInt(multi.getParameter("usepeople")));
		cbean.setCompany(multi.getParameter("company"));
		cbean.setInfo(multi.getParameter("info"));
		
		Enumeration<?> files = multi.getFileNames();
		
		String file1 = (String) files.nextElement();
		
		cbean.setImg(multi.getFilesystemName(file1));
		
	
	
		AdminRentCarDAO cdao = new AdminRentCarDAO();
		cdao.updateCar(cbean);
		
		response.sendRedirect("AdminMain.jsp?center=AdminCarAllList.jsp");
	%>
	</body>
</html>