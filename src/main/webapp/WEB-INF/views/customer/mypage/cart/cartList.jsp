<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

<title>장바구니 목록</title>
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
// 장바구니 진입 시 자동 체크 처리 
function checked(){
	$('#all_check').prop('checked', true);
	$('.pd_check').prop('checked', true);
	$('.pd_check').attr('name', 'checked');
}

$(function(){
	// 전체선택 클릭 시 체크박스 true/ false
	$('#all_check').click(function(){
		if ($('#all_check').prop('checked')) {
			$('.pd_check').prop('checked', true);
			$('.pd_check').attr('name', 'checked');
		}else{
			$('.pd_check').prop('checked', false);
			$('.pd_check').attr('name', 'check');	
		}			
	});
	
	// 체크박스 클릭 시 checked 처리
	$('.pd_check').click(function(){
		if ($(this).prop('checked')) {			
			$(this).attr('name', 'checked');
		}else{			
			$(this).attr('name', 'check');		
		}
	})
	
	// '선택 삭제' 버튼
	$('#selectDel').click(function(){
		if($('input:checkbox[name="checked"]').length == 0){
			alert("삭제할 상품을 선택해 주세요.");
			return;
		}else{
			if(confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")){
				document.cartform.action = "${path}/cartDeleteAction.cu";
				document.cartform.submit();
			} else {
				return;
			}
		}		
	});
	
	// '선택 구매' 버튼
	$('#selectBuy').click(function(){
		if($('input:checkbox[name="checked"]').length == 0){
			alert("구매할 상품을 선택해 주세요.");
			return;
		}else{
			if(confirm("장바구니에서 해당 상품을 구매하시겠습니까?")){
				document.cartform.action = "${path}/cartOrder.or";
				document.cartform.submit();
			} else {
				return;
			}
		}		
	});
	
	// 체크박스 체크 여부에 따른 가격 계산
	$('.pd_check').change(function() { // 개별 체크 
		var total = Number(0);		 
		// forEach varStatus="status"이므로 index 부여
		$(".cartData").each(function(index, element){
		// 체크박스가 체크되어 있으면  
		if ($(this).find('.pd_check').is(":checked")) {	 			
			// 총 가격
			total = total + parseInt($(this).find('.cartTotal').html());  			 
		}
		});
		 $("#checkedTotal").html("<h4>"+total + " 원<h4>"); // 가격 설정
	});   
	$('#all_check').change(function() { // 전체 체크
		var total = Number(0);		 
		// forEach varStatus="status"이므로 index 부여
		$(".cartData").each(function(index, element){
		// 체크박스가 체크되어 있으면  
		if ($(this).find('.pd_check').is(":checked")) {	 			
			// 총 가격
			total = total + parseInt($(this).find('.cartTotal').html());  			 
		}
		});
		 $("#checkedTotal").html("<h4>"+total + " 원<h4>"); // 가격 설정
	});  
	 
	// 수량 변경 버튼
	$(".updateButton").click(function(){
		// data-num="${dto.cartNo}"
		var cartNo = $(this).data("num");
		// data-num 이전 값 cartCnt
		var cartCnt = $(this).prev().val();
		// data-num 이후 값 (hidden) price
		var price = $(this).next().val();
		// get 방식으로 이동 
		location.href = '${path}/cartUpdateAction.cu?cartCnt='+cartCnt+'&cartNo='+cartNo+'&price='+price;		      
	});
	
});
</script>


</head>
<body onload="checked();">
<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   
   
   <!-- 컨텐츠 시작 -->
	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Cart</h1>
			</div>
			<!-- 상단 중앙2 시작 -->
			<div id="section2" class="cartInfo">					
				<div class="table_div">
					 <form name="cartform" method="post">
					 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 장바구니</li></ul>
						
						<table style="width:1000px; border: 1px solid">
							<thead>
							<tr align="center">								
								<th style="width: 4%">
									<label for="all_check"></label> 
									<input type="checkbox" id="all_check" name="all_check" value="all_check">전체
								</th>														
								<th style="width: 10%">상품명</th>
								<th style="width: 12%">이미지</th>
								<th style="width: 6%">수량</th>
								<th style="width: 8%">가격</th>
								<th style="width: 7%">합계</th>															
							</tr>
							</thead>
							<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="6" align="center">
										<br><br><h3><span style="color: pink">${sessionScope.customerID}</span>님의 장바구니에 포함된 상품이 없습니다.</h3><br><br>
									</td>
								<tr>
							</c:if>
							<c:if test="${not empty list}">							
							<c:forEach var="dto" items="${list}" varStatus="status">							
								<tr class="cartData">
									<th>
										<label for="pd"></label> 
										<input type="checkbox" name="check" id="check" class="pd_check" value="${dto.cartNo}">								
										<input type="hidden" id="pdNo" value="${dto.pdNo}">										
										<input type="hidden" id="cartTotal" value="${dto.cartTotal}">
									</th>												
									<td>${dto.pdName}</td>
									<td><img src="${dto.pdImg}" width=100px height=100px></td>								
									<td>
										<input type="number" id="cartCnt" class="cartCnt" value="${dto.cartCnt}">
										<input type="button" class="updateButton" value="변경" data-num="${dto.cartNo}" style="border:1px solid; background: transparent;">
										<input type="hidden" id="price" class="price" value="${dto.price}">
									</td>
									<td class="price">${dto.price} 원</td>																					
									<td class="cartTotal">${dto.cartTotal}</td>									
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
											<c:set var="total" value="${total = total + each.cartTotal}"></c:set>
										</c:forEach>
										<div>결제 예상금액</div>
										<div id="checkedTotal"><h4>${total} 원</h4></div>																				
									</div>
								</div>
								<div class="text-center">
									<input type="button" value="계속 쇼핑하기" class="btn btn-dark" onclick="window.location='${path}/showAll.do'">
									<button type="button" class="btn btn-dark" id="selectBuy">선택 주문</button>	
									<button type="button" class="btn btn-dark" id="selectDel">선택 삭제</button>											
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