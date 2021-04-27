<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			
		function button_event(){
			var form = document.reserveForm;
			if (confirm("예약하시겠습니까?") == true){//확인
			    form.submit();
			}else{//취소
			    return;
			}
		}
		</script>
	</head>
	<body>
		<%
		int no = Integer.parseInt(request.getParameter("no"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		String img =request.getParameter("img");
		%>
		
		<div class="container">
		<br><br><br><br><br>
		<form name="reserveForm"  action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
		<div class="row">
			<div class="col-md-5" style="margin-right: 70px; margin-left: 20px">
				<img src="./images/<%=img %>" style="width:100%;">
			</div>
			<div class="col-md-6">
				<h3>옵션 선택</h3><br>
				<p><b>대여기간 ㅣ</b> 
				<select name="dday" class="custom-select col-sm-3">
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
					<option value="6">6일</option>
					<option value="7">7일</option>
				</select>
				</p>
				<p><b>대여일 ㅣ </b> <input type="date" name="rday" size="15"> </p>
				<p><b>보험적용 ㅣ </b>
				<select name="usein" class="custom-select col-sm-4">
					<option value="1">적용(1일 1만원)</option>
					<option value="2">미적용</option>
				</select>
				</p>
				<p><b>wifi ㅣ </b> 
				<select name="usewifi" class="custom-select col-sm-4">
					<option value="1">적용(1일 1만원)</option>
					<option value="2">미적용</option>
				</select>
				</p>
				<p><b>네비게이션 : </b>
				<select name="usenavi" class="custom-select col-sm-3">
					<option value="1">적용(무료)</option>
					<option value="2">미적용</option>
				</select>
				</p>
				<p>
				<input type="hidden" name="no" value="<%=no%>">
				<input type="hidden" name="qty" value="<%=qty%>">
				<input type="button" value="차량 예약" class="btn btn-secondary col-sm-5" onclick="button_event();">
				<a href="RentcarMain.jsp?center=CarAllList.jsp" class="btn btn-light">상품 목록 &raquo;</a>
				</p>
			</div>
		</div>
		</form>
		<br><br><br><br><br>
	</div>
	</body>
</html>