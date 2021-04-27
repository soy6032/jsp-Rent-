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
		int category = bean.getCategory();
		String cate = "";
		if(category == 1){
			cate = "소형";
		}
		else if(category == 2){
			cate = "중형";
		}
		else{
			cate = "대형";
		}
		
		%>
		
		<div class="container">
		<br><br><br><br><br>
		<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
		<div class="row">
			<div class="col-md-5" style="margin-right: 70px; margin-left: 20px">
				<img src="./images/<%=bean.getImg() %>" style="width:100%;">
			</div>
			<div class="col-md-6">
				<h3><%= bean.getName() %></h3>
				<p><%= bean.getName() %></p>
				<p><b>차량분류 ㅣ</b><span class="badge badge-danger"><%= cate %></span>
				<p><b>가격 : </b><%= bean.getPrice() %>원</p>
				<p><b>제조사 : </b><%= bean.getCompany() %></p>
				<p><b>info : </b><%=bean.getInfo() %></p>
				<p><b>차량 수 : </b>
				<select name="qty" class="custom-select col-sm-3">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select>
				</p>
				<p>
				<input type="hidden" name="no" value="<%=bean.getNo()%>">
				<input type="hidden" name="img" value="<%=bean.getImg()%>">
				<input type="submit" value="옵션 선택" class="btn btn-secondary col-sm-5">
				<a href="RentcarMain.jsp?center=CarAllList.jsp" class="btn btn-light">상품 목록 &raquo;</a>
				
				</p>
			</div>
		</div>
		</form>
		
		<br><br><br><br><br>
	</div>
	</body>
</html>