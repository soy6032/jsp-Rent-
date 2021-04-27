<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
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
		int no = Integer.parseInt(request.getParameter("no"));
		
		RentcarDAO rdao = new RentcarDAO();
		CarListBean bean = rdao.getOneCar(no);
		
		%>
		
		<div class="container"style="margin-top: 100px; margin-bottom: 100px;">
  		<h5 style="text-align: center;">차량 수정</h5><br>
  		<form action="CarListUpdateProc.jsp" method="post" enctype="multipart/form-data" name="CarUpdateForm">
    	<div class="form-group" >  
      		차량 이름 : <input type="text" name="name" class="form-control" value="<%=bean.getName() %>">
    	</div>
    	<div class="form-group">
      		차량 분류 : <select name="categoty" class="form-control">
						<option value="1">소형</option>
						<option value="2">중형</option>
						<option value="3">대형</option>
					 </select>
    	</div>
    	<div class="form-group">
      		차량 가격 : <input type="text" name="price" class="form-control" value="<%=bean.getPrice()%>">
    	</div>
    	<div class="form-group">
      		최대 인원 : <input type="text" name="usepeople" class="form-control" value="<%=bean.getUsepeople()%>">
    	</div>
    	<div class="form-group">
      		회 사 : <input type="text" name="company" class="form-control" value="<%=bean.getCompany()%>">
    	</div>
    	<div class="form-group">
      		차량 사진 : <input type="file" class="form-control-file border"name="img" id="img" value="<%=bean.getImg()%>">
    	</div>
    	<div class="form-group">
      		info : <textarea name="info" class="form-control" rows="5" ><%=bean.getInfo()%></textarea>
    	</div>
    	<input type="hidden" name="no" value="<%=bean.getNo() %>">
    	<button type="submit" class="btn btn-primary">차량 수정</button>
  	</form>
	</div>
	</body>
</html>