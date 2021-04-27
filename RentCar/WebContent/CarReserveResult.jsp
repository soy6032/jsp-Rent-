<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="rbean" class="db.CarReserveBean">
			<jsp:setProperty name="rbean" property="*" />
		</jsp:useBean>
		
		<%
		String id = (String)session.getAttribute("id");
		if(id==null){
		%>
		<script type="text/javascript">
			alert("로그인 후 예약이 가능합니다.");
			location.href='RentcarMain.jsp?center=Memberlogin.jsp'
		</script>
		<%
		}
		
		//날짜 비교
		Date d1 = new Date();
		Date d2 = new Date();
		//날짜를 2020-4-4 형식으로 포맷해주는 클래스 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		d1 = sdf.parse(rbean.getRday());
		d2 = sdf.parse(sdf.format(d2));
		//날짜 비교 메소드를 사용
		int compare = d1.compareTo(d2);
		//예약하려는 날짜보다 현재 날짜가 크다면 -1
		//예약하려는 날짜와 현재 날짜가 같다면 0
		//예약하려는 날짜가 더 크다면 1
		if(compare < 0){//오늘보다 이전 날짜 선택시
			
			%>
			<script type="text/javascript">
				alert("현재 날짜보다 이전 날짜는 선택할 수 없습니다");
				history.go(-1);
			</script>
			<%
		}else{
		
		//결과적으로 아무런 문제가 없다면 데이터를 저장 후 결과 페이지 보여주기
		//아이디 값이 빈 클래스에 없기에 
		String id1 = (String)session.getAttribute("id");
		rbean.setId(id1);
		
		//데이터베이스에 빈클래스를 저장
		RentcarDAO rdao = new RentcarDAO();
		rdao.setReserveCar(rbean);
		
		CarListBean cbean = rdao.getOneCar(rbean.getNo());
		
		//차량 총 금액
		int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
		//옵션 금액
		int usein = 0;
		if(rbean.getUsein()==1){
			usein = 10000;
		}
		int usewifi = 0;
		if(rbean.getUsewifi()==1){
			usewifi = 10000;
		}
		int totaloption = (rbean.getQty()*rbean.getDday())*(usein + usewifi);
		
		%>
		
		<div class="container col-sm-3"style="margin-top: 100px; margin-bottom: 100px;">
  			<h4 style="text-align: center;">예약이 완료되었습니다.</h4><br><br>
  			<div class="card">
    			<div class="card-header"><img src="images/<%=cbean.getImg()%>" width="300px"></div>
    			<div class="card-body">
    			
    			<table class="table table-borderless">
    				<thead>
      					<tr>
        					<th>차량 금액</th>
        					<th>옵션 금액</th>
        					<th>총 금액</th>
      					</tr>
    				</thead>
    				<tbody>
      					<tr>
        					<td><%= totalcar %>원</td>
        					<td><%= totaloption %>원</td>
        					<td><%= totalcar + totaloption%>원</td>
      					</tr>
      				</tbody>
     			</table>
					
    			
    			</div>
    			<div class="card-footer">
    				<button class="btn btn-primary btn-block" onclick="location.href='RentcarMain.jsp?center=CarReserveView.jsp'">예약확인</button>
    			</div>
  			</div>
		</div>
		
		<%
		}
		%>
	</body>
</html>