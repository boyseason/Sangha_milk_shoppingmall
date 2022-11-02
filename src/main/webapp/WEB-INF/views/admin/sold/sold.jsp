<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 - 결산</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<!-- 구글 차트 라이브러리 이용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>	
<script type="text/javascript">	
$(function(){	
	// 구글 차트 라이브러리 불러오기
	google.charts.load('current', {'packages':['bar']});
	// 차트 정보 받아서 차트 출력
	google.charts.setOnLoadCallback(drawChart);
	
	// '구매승인' > '구매완료'
	$("#buyConfirm").click(function(){		
		alert("구매 승인하였습니다");
		// button에 buyNo 부여하여 get 방식으로 이동
		var buyNo = $(this).data("num");
		location.href = '${path}/buyConfirm.or?buyNo='+buyNo; 
	});	
	
	// '환불요청' > '환불승인' 
	$("#confirmRefund").click(function(){
		alert("환불 승인하였습니다");
		// button에 buyNo 부여하여 get 방식으로 이동
		var buyNo = $(this).data("num");
		location.href = '${path}/confirmRefund.or?buyNo='+buyNo;	
	});
});

//차트 정보 설정
function drawChart(){	
	// 데이터 입력에 필요한 변수 설정
	var years = []; // 연을 받을 배열
	var months = []; // 월을 받을 배열
	var days = []; // 일을 받을 배열
	// date format 처리한 정보를 soldArr에 받기 '[2022-09-27, 2022-09-20, 2022-09-21]'
	var soldArr = '${date}'; 
	var soldDate = soldArr.split('[').join('').split(']').join(''); // 양 끝 문자열 제거
	var soldRow = soldDate.split(', '); // soldDate는 배열이므로 요소 분리
	var soldCnt = []; // 판매건을 받을 배열
	var soldTotal = []; // 판매액을 받을 배열
	console.log(soldDate);
	console.log(soldRow);
	
	// 데이터(차트) 설정 
	var dataTotal = new google.visualization.DataTable(); // 날짜-판매액 차트
	var dataCnt = new google.visualization.DataTable(); // 날짜-판매건 차트
	
	// 차트 컬럼명 설정
	dataTotal.addColumn('datetime', '날짜');
	dataTotal.addColumn('number', '매출액');
	
	dataCnt.addColumn('datetime', '날짜');
	dataCnt.addColumn('number', '매출건');
	
	
	$(".soldData").each(function(index, element){
		soldCnt.push(parseInt($(this).find('.soldCnt').html()));
		soldTotal.push(parseInt($(this).find('.soldTotal').html()));  			 
	});
	
	// list의 크기만큼 row에 담아서 add
	for (var i = 0; i < ${list.size()}; i++) {
		var chartDate = soldRow[i].split('-');
		// split()을 통해 2022-09-27 > [2022, 09, 27]의 배열로 변환
		years.push(parseInt(chartDate[0])); // 연
   	 	months.push(parseInt(chartDate[1])); // 월
   	 	days.push(parseInt(chartDate[2])); // 일
		var totalRow = [new Date(years[i], months[i]-1, days[i]), soldTotal[i]];
		var cntRow = [new Date(years[i], months[i]-1, days[i]), soldCnt[i]];
        // totalRow = [new Date(연, 월, 일), 매출액]
        // cntRow = [new Date(연, 월, 일), 매출건]
        
        // dataRow에 담긴 데이터 그래프 반영 > 행(바)
    	dataTotal.addRow(totalRow);
    	dataCnt.addRow(cntRow);
    }
	
	// 차트 옵션 설정
	var options = {
		title : '날짜별 매출', 
		vAxis : {title: '매출'}, // y축
		hAxis : {title: '날짜', 
				 format: 'yyyy-MM-dd' 				
				}, // x축
		width : 900,
		height : 400,
		seriesType: 'bars', // 차트 종류 : 바
	};
	
	// 차트 객체 생성
	var chartTotal = new google.charts.Bar(document.getElementById('chart_total'));
	var chartCnt = new google.charts.Bar(document.getElementById('chart_cnt'));
	
	// 차트 출력
	chartTotal.draw(dataTotal, google.charts.Bar.convertOptions(options));
	chartCnt.draw(dataCnt, google.charts.Bar.convertOptions(options));
}
</script>

</head>
<body>
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
   <!-- header 끝 -->
   
   
   <!-- 컨텐츠 시작 -->
	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Sold Result</h1>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2" class="cartInfo">
			<div id="left">
               <div class="left_inside">
                  <!-- 좌측 메뉴바 시작 -->            
                   <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp"%> 
                  <!-- 좌측 메뉴바 종료 -->
               </div>
            </div>					
				<div class="table_div">
					 <form name="buyform" method="post">
					 
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 결산</li></ul>
						
						<table style="width:1000px; border: 1px solid">
							<thead>
							<tr align="center">								
								<th style="width: 33%">판매일</th>														
								<th style="width: 33%">판매건</th>
								<th style="width: 33%">금액</th>														
							</tr>
							</thead>							
							<tbody>	
							<c:if test="${empty list}">
								<tr>
									<td><h2> 결산 내역이 존재하지 않습니다. </h2></td>
								</tr>
							</c:if>								
							<c:if test="${not empty list}">							
							<c:forEach var="dto" items="${list}" varStatus="status">																						
								<tr class="soldData">
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.soldDate}" />
									</td>																										
									<td class="soldCnt">${dto.soldCnt}</td>
									<td class="soldTotal">${dto.soldTotal}</td>																																												
								</tr>
							</c:forEach>
								<tr>
									<td colspan="3">
										<input type="button" value="주문관리" onclick="window.location='${path}/adminOrder.or'">										
									</td>
								</tr>							
							</c:if>
							</tbody>				
					</table>
					<br><br><br>				
					<div id="chart_total" style="width: 800px; height: 500px;"></div>
					<div id="chart_cnt" style="width: 800px; height: 500px;"></div>														    				
				</form>								
			</div>
		</div>
		<!-- container -->
		</div>
	</div>
</div>
	<!-- 컨텐츠 종료 -->
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>