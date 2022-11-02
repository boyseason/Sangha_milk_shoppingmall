<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>관리자 - 주문 관리</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<script type="text/javascript">	
$(function(){
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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Admin Order</h1>
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
					 
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 주문 관리</li></ul>
						
						<table style="width:1000px; border: 1px solid">
							<thead>
							<tr align="center">								
								<th style="width: 4%">구매번호</th>														
								<th style="width: 10%">상품명</th>
								<th style="width: 12%">이미지</th>
								<th style="width: 6%">구매수량</th>
								<th style="width: 6%">구매금액</th>
								<th style="width: 10%">이메일</th>
								<th style="width: 7%">휴대폰</th>	
								<th style="width: 7%">구매일</th>	
								<th style="width: 7%">주문상태</th>
								<th style="width: 5%">승인/환불</th>						
							</tr>
							</thead>
							<tbody>							
							<c:if test="${not empty list}">							
							<c:forEach var="dto" items="${list}">
							<input type="hidden" id="pdNo" name="pdNo" value="${dto.pdNo}">																
								<tr>
									<td>${dto.buyNo}</td>												
									<td>${dto.pdName}</td>
									<td><img src="${dto.pdImg}" width=100px height=100px></td>								
									<td>${dto.buyCnt}</td>
									<td>${dto.buyTotal} 원</td>
									<td>${dto.email}</td>
									<td>${dto.phone}</td>
									<td>${dto.buyDate}</td>
									<td>${dto.buyState}</td>																					
									<td>
											
									<!-- 관리자 버튼 -->
									<c:if test="${dto.buyState == '주문요청'}">										
										<input type="button" id="buyConfirm" class="buyConfirm" value="구매승인" data-num="${dto.buyNo}">
									</c:if>								
									<c:if test="${dto.buyState == '환불요청'}">
										<input type="button" id="confirmRefund" class="confirmRefund" value="환불승인" data-num="${dto.buyNo}">
									</c:if>
									</td>									
								</tr>
							</c:forEach>								
							</c:if>
							</tbody>				
					</table>					
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