<%@page import="java.util.ArrayList"%>
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
		RentcarDAO rdao = new RentcarDAO();
		ArrayList<CarListBean> v = rdao.allselectCar();
		%>
		
		<div class="jumbotron" style="background-color: white; height: 800px">
			<div class="container">
				<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post"  style="text-align: center;">
    				<select name="category" class="custom-select col-sm-3">
     					<option value="1">소형</option>
      					<option value="2">중형</option>
      					<option value="3">대형</option>
    				</select>
    				<button type="submit" class="col-sm-1 btn btn-light">검색</button>
  				</form><br>
  			</div>
			<br><br>
			<div class="container">
				<table width ="100%">
		<%
		
		//tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록하는 변수선언
		int j = 0;
		for(int i = 0; i < v.size(); i++){
			//벡터에 저장되어있는 빈클래스를 추출
			CarListBean bean = v.get(i);
			if(j % 3 == 0){
		%>	
			
				<tr>	
		<%
			}
		%>
				<td width="33.33%" align="left">
					<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
    					<img src="images/<%=bean.getImg() %>" style="width:90%">
    				</a>
      				<h4 class="card-title"><%=bean.getName() %></h4>
   					<p><%=bean.getInfo() %></p>
   				</td>
   				
		<%
			j = j + 1;
		}
		%>
		
		
				</table>
		<br><br><br><br><br><br><br><br><br>
	</body>
</html>