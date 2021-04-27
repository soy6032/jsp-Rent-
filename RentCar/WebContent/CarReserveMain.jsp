<%@page import="java.util.ArrayList"%>
<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Insert title here</title>
	</head>
	<body>
		<!--DB에 연결하여 최신순 자동자 3대만 뿌려주는 데이터를 가져옴  -->
		
		<% 
		RentcarDAO rdao = new RentcarDAO();
		//벡터를 이용하여 자동차를 결정
		ArrayList <CarListBean> v = rdao.getSelectCar();
		
		%>
		
	
		
		<div class="jumbotron" style="background-color: white; height: 800px">
			<div class="container">
				<table	width ="100%">
					<tr height="150px">
						<td align="center"colspan="3">
							<h2>New Rent</h2>
						</td>
					</tr>
		<%		for(int i = 0;i<v.size();i++){ 
					CarListBean bean = v.get(i);
		%>
					<td width="33.33%" align="left">
						<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
    						<img src="images/<%=bean.getImg() %>" style="width:90%">
    					</a>
      					<h4 class="card-title"><%=bean.getName() %></h4>
      					<p><%=bean.getInfo() %></p>
					</td>	
		<% 			
			}
		%>
				</table>
			</div>
			<br><br><br><br>
			<div class="container">
			<h3 style="text-align: center;">차량 검색</h3><br>
			<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'" class="col-sm-5 btn btn-light" style="display: block; width: 300px; margin: 0 auto;">전체 검색</button>
			<br>
			<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post"  style="text-align: center;">
    			<select name="category" class="custom-select col-sm-3">
     				<option value="1">소형</option>
      				<option value="2">중형</option>
      				<option value="3">대형</option>
    			</select>
    			<button type="submit" class="col-sm-1 btn btn-light">검색</button>
  			</form><br>
  			
  		</div>
		</div>
		
		
		
		<br><br><br><br>
		
	</body>
</html>