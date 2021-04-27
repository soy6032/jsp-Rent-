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
	//카테고리 분류값을 받아옴
			int category = Integer.parseInt(request.getParameter("category"));
			
			RentcarDAO rdao = new RentcarDAO();
			ArrayList<CarListBean> v = rdao.getCategoryCar(category);
			
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
	<div class="jumbotron" style="background-color: white; height: 800px">
		<div class="container">
			<h5 style="text-align: center;">'<%=cate %>' &nbsp;&nbsp;검색결과</h5><br>
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