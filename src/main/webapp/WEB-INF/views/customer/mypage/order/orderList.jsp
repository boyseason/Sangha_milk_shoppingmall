<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>주문 목록</title>
<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">
<!-- 1. fontawsome.com에서 인증(start for free)
    2. 이미지 사용 가능 -->
<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">


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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Order</h1>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2">					
				<div class="table_div">
					 <form name="orderform" method="post" action="${path}/buyAdd.or">
					 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 주문/결제</li></ul>
						<table style="width:1000px; border: 1px solid; border-collapse: collapse">
							<tr align="center">
								<th>이름</th>
								<td>${list[0].name}</td>							
								<th>이메일</th>
								<td>${list[0].email}</td>
							</tr>
							<tr align="center">
								<th>휴대폰 번호</th>
								<td>${list[0].phone}</td>							
								<th>배송 주소</th>
								<td>${list[0].address}</td>
							</tr>
						</table>
						<table style="width:1000px; border: 1px solid; border-collapse: collapse">
							<thead>
							<tr align="center">								
								<th style="width: 12%">이미지</th>													
								<th style="width: 10%">상품정보</th>
								<th style="width: 6%">수량</th>
								<th style="width: 8%">가격</th>
								<th style="width: 7%">합계</th>															
							</tr>
							</thead>
							<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5" align="center">
										<br><br><h3><span style="color: pink">${sessionScope.customerID}</span>님이 구매하시려는 상품이 없습니다.</h3><br><br>
									</td>
								<tr>
							</c:if>							
							<c:if test="${not empty list}">							
							<c:forEach var="dto" items="${list}">
							<input type="hidden" id="orderNo" name="orderNo" value="${dto.orderNo}">
							<input type="hidden" id="pdNo" class="pdNo" value="${dto.pdNo}">
							<input type="hidden" id="orderCnt" class="orderCnt" value="${dto.orderCnt}">
							<input type="hidden" id="price" class="price" value="${dto.price}">
							<input type="hidden" id="orderTotal" class="orderTotal" value="${dto.orderTotal}">							
								<tr>
									<td><img src="${dto.pdImg}" width=100px height=100px></td>											
									<td>${dto.pdName}</td>															
									<td>${dto.orderCnt}</td>
									<td class="price">${dto.price} 원</td>																					
									<td class="orderTotal">${dto.orderTotal}</td>									
								</tr>
							</c:forEach>								
							</c:if>
							</tbody>				
					</table>
					<br><br><br><br>
					<div class="container overflow-hidden">
								<div class="row">								
									<h3>총 주문금액</h3>
								</div>
								<div class="row">									
									<div class="float-right">
										<c:set var="total" value="0"></c:set>
										<c:forEach var="each" items="${list}">
											<c:set var="total" value="${total = total + each.orderTotal}"></c:set>
										</c:forEach>
										<div>결제 예상금액</div>
										<div id="checkedTotal"><h4>${total} 원</h4></div>																				
									</div>
								</div>
								<div class="text-center">
									<input type="submit" class="btn btn-dark" value="결제하기">
									<input type="button" class="btn btn-dark" value="주문 취소" onclick="window.location='${path}/orderDelete.or'">																		
								</div>
							</div>
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