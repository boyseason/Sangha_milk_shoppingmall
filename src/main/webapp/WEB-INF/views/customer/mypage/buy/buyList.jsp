<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>고객 구매 목록</title>
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
	// '구매완료' > '환불요청' (고객)
	$('#buyRefund').click(function(){	
		alert("환불 요청하였습니다");
		// button에 buyNo 부여하여 get 방식으로 이동
		var buyNo = $(this).data("num");
		location.href = '${path}/buyRefund.or?buyNo='+buyNo;		
	});

	// '환불 승인' > '구매 삭제' (고객) 
	$('#buyDelete').click(function(){	
		// button에 buyNo 부여하여 get 방식으로 이동
		if(confirm("구매 내역을 삭제하시겠습니까?")){
			var buyNo = $(this).data("num");
			location.href = '${path}/buyDelete.or?buyNo='+buyNo;
		}
	});
});
</script>


</head>
<body>
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   
   
   <!-- 컨텐츠 시작 -->
	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Buy List</h1>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2" class="cartInfo">					
				<div class="table_div">
					 <form name="buyform" method="post">
					 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 구매 내역</li></ul>
						
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
							<c:if test="${empty list}">
								<tr>
									<td colspan="10" align="center">
										<br><br><h3><span style="color: pink">${sessionScope.customerID}</span>님이 구매하신 상품이 없습니다.</h3><br><br>
									</td>
								<tr>
							</c:if>	
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
									
									<!-- 고객 버튼 -->
									<c:choose>										
										<c:when test="${dto.buyState == '주문요청'}">
											<input type="button" value="승인대기">
										</c:when>
										<c:when test="${dto.buyState == '구매완료'}">
											<input type="button" id="buyRefund" value="환불요청" data-num="${dto.buyNo}">
										</c:when>
										<c:when test="${dto.buyState == '환불승인'}">
											<input type="button" id="buyDelete" value="환불완료" data-num="${dto.buyNo}">
										</c:when>										
									</c:choose>
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