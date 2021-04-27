<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"> -->
	</head>
	<body>
		
		<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
  			
  			<p style="text-align: center;"><img src="./images/test.jpg"></p><br><br>
  			<h3 style="text-align: center;">자주하는질문</h3><br>
  			<div id="accordion">
    			<div class="card">
      				<div class="card-header">
        				<a class="card-link" data-toggle="collapse" href="#collapseOne" style="color: black;">
        				<i class="bi bi-question-circle" style="font-size: 24px; color: black; margin-right: 50px" ></i>
          					차량 대여 조건은 어떻게 되나요?
        				</a>
      				</div>
      			<div id="collapseOne" class="collapse" data-parent="#accordion">
       				<div class="card-body">
          				도로교통법상 유효한 운전 면허증을 반드시 소지하시고 이용 바랍니다.<br>
						운전 경력은 현재 소지하고 있는 면허증의 운전면허 취득일 기준이며, <br>
						재발급으로 인해 운전 경력이 증명이 안되는 경우 민원24( www.minwon.go.kr) 운전 경력증명서를 발급받으셔서 이용 바랍니다.<br>
						<br>
						1. 운전면허<Br>
						☞ 승용차, 9인승 이하 승합차 : 2종 보통면허 이상<br>
						☞ 11인승 이상 승합차 : 1종 보통면허 이상<br>
						<br>
						2. 차종별 대여 조건<br>
						☞ 경차~중형 : 만 21세 이상, 운전 경력 1년 이상<br>
						☞ 대형, 고급, SUV/RV, 승합 : 만 26세 이상, 운전 경력 3년 이상<br>
        			</div>
      			</div>
    		</div>
    		<div class="card">
      			<div class="card-header">
        			<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" style="color: black;">
        				<i class="bi bi-question-circle" style="font-size: 24px; color: black; margin-right: 50px" ></i>
        				차량 인수 및 반납은 어떻게 하나요?
      				</a>
      			</div>
      			<div id="collapseTwo" class="collapse" data-parent="#accordion">
        			<div class="card-body">
          				결제가 완료되면 5분 이내로 예약 정보가 장문문자가 자동 발송되며, 예약 내역 및 차량 인수 정보 확인이 가능합니다.
        			</div>
      			</div>
    		</div>
    		<div class="card">
      			<div class="card-header">
        			<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree" style="color: black;">
        				<i class="bi bi-question-circle" style="font-size: 24px; color: black; margin-right: 50px" ></i>
          				렌트카 차량 정보는 어떻게 확인되나요
        			</a>
      			</div>
      			<div id="collapseThree" class="collapse" data-parent="#accordion">
        			<div class="card-body">
          				소형, 중형, 대형, SUV/RV, 승합, 수입, 전기차 등,, 다양한 차종을 대여하실 수 있습니다.<br>
						공급사에서 제공되는 차량에 따라 연식, 제조사명, 연료 타입, 옵션(네비, 후방 센서, 후방카메라, 블루투스, 블랙박스, USB 등..) 이 모두 상이합니다.<br>
						차량에 포함되어 있지 않은 옵션 사항은 요청이 불가하오니, 상품 상세 페이지에서 차량 정보를 확인 후 예약 바랍니다.<br>
        			</div>
      			</div>
    		</div>
  			</div>
		</div>
		<div class="container">
		<h3 style="text-align: center;">찾아오시는길</h3><br>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3262.450534585516!2d129.10476401509584!3d35.14538308032274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568ece74f98f7cf%3A0x5d56b042b45ac6d0!2z67aA7IKw6rSR7Jet7IucIOyImOyYgeq1rCDrgqjsspwx64-ZIOyImOyYgeuhnDQyN-uyiOq4uCA1Mi04!5e0!3m2!1sko!2skr!4v1612074916049!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		</div>
		<br><br><br><br><br><br>
	</body>
</html>