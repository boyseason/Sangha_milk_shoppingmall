<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때가지 html이 브라우저창에 표시가 안 되는 것을 방지 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<script type="text/javascript">

</script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
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
					 <form name="orderform" method="post" action="{path}/buyAdd.or">
					 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 주문 완료</li></ul>
						<p>고객님이 주문하신  상품이 주문완료되었습니다.</p>
						<h3>주문시각 : ${list[0].orderDate}</h3>
						<table style="width:1000px; border: 1px solid">
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
							<c:if test="${not empty list}">							
							<c:forEach var="dto" items="${list}">
							<input type="hidden" id="orderNo" class="orderNo" value="${dto.orderNo}">
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
										<div id="checkedTotal"><h4>${total} 원</h4></div>																				
									</div>
								</div>
								<div class="text-center">
									<input type="button" value="계속 쇼핑하기" class="btn btn-dark" onclick="window.location='${path}/showAll.st'">
									<input type="button" value="홈으로" class="btn btn-dark" onclick="window.location='${path}/main.do'">																												
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

</div>

</body>
</html>