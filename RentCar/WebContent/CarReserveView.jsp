<%@page import="java.util.ArrayList"%>
<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
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
		String id = (String)session.getAttribute("id");
		
		if(id == null){
		%>	
			<script>
				alert("로그인 후 이용 가능합니다.");
				location.href="RentcarMain.jsp?center=Memberlogin.jsp";
			</script>	
		<% 	
		}
		
		//로그인 되어있는 아이디를 읽어옴
		RentcarDAO rdao = new RentcarDAO();
		ArrayList<CarViewBean> v = rdao.getAllReserve(id);
		
		
		%>
		
		<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
		<h5 style="text-align: center;">예약 확인</h5><br>
		<table class="table table-hover">
		<thead>
			<tr>
				<td align="center">이미지 </td>
				<td align="center">이름 </td>
				<td align="center">대여일</td>
				<td align="center">대여기간</td>
				<td align="center">금액</td>
				<td align="center">수량</td>
				<td align="center">보험</td>
				<td align="center">WIFI</td>
				<td align="center">네비게이션</td>
				<td></td>
			</tr>
		</thead>
	<% 
			for(int i =0 ; i< v.size() ; i++){			
				CarViewBean bean = v.get(i);
				String usein = "미적용";
				if(bean.getUsein()==1){
					usein = "적용";
				}
				String usewifi = "미적용";
				if(bean.getUsewifi()==1){
					usewifi = "적용";
				}
				String usenavi = "미적용";
				if(bean.getUsenavi()==1){
					usenavi = "적용";
				}
	%>
			<tr>
				<td align="center" ><img alt ="" src="images/<%=bean.getImg()%>"  width="120"></td>
				<td align="center" style="line-height: 80px"><%=bean.getName()%></td>
				<td align="center" style="line-height: 80px"><%=bean.getRday()%></td>
				<td align="center" style="line-height: 80px"><%=bean.getDday()%>일</td>
				<td align="center" style="line-height: 80px"><%=bean.getPrice()%>원</td>
				<td align="center" style="line-height: 80px"><%=bean.getQty()%>대</td>
				<td align="center" style="line-height: 80px"><%=usein%></td>
				<td align="center" style="line-height: 80px"><%=usewifi%></td>
				<td align="center" style="line-height: 80px"><%=usenavi%></td>
				<td align="center" style="line-height: 80px">
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="CarReserveDel.jsp?reserveno=<%=bean.getReserveno()%>"  class="btn btn-light">삭제</a>
				</td>
			</tr>
	<% 		
			}
	%>
			</table>
		</div>
	</body>
</html>