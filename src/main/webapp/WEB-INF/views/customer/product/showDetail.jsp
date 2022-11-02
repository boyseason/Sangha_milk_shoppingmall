<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문상세</title>
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

<script type="text/javascript">
$(function(){
	// 상품목록으로 돌아가기
   	$("#btnList").click(function(){
      	location.href="${path}/showAll.st";
   	});
	
   	// 바로 구매
	$("#insertOrder").click(function(){
		// validation check
		var orderCnt = $("#orderCnt").val();
		if(!orderCnt){
			alert("구매 수량을 입력하세요");
			$("#orderCnt").focus();
			return false;
		}					
		document.orderForm.action = "${path}/orderAdd.or";
		document.orderForm.submit();
   	});
   	
	// 장바구니 추가
	$("#insertCart").click(function(){
		// validation check
		var orderCnt = $("#orderCnt").val();
		if(!orderCnt){
			alert("구매 수량을 입력하세요");
			$("#orderCnt").focus();
			return false;
		}
		
		document.orderForm.action = "${path}/cartAddAction.cu";
		document.orderForm.submit();
   	});
});
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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Product Detail</h1>
			</div>	
			<!-- 상단 중앙2 시작 -->
			<div id="section2">					
				<div class="table_div">
					<form method ="post" name="orderForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<!-- hidden : input 태그에서 직접 입력받지 못한 값 전달할 때 사용 -->
						<input type="hidden" name="pdNo" value="${dto.pdNo}">
						<input type="hidden" name="pdName" value="${dto.pdName}">
						<input type="hidden" name="pdImg" value="${dto.pdImg}">
						<input type="hidden" name="price" value="${dto.price}">
						
						<ul><li><span style="color: pink">${sessionScope.customerID}</span>님의 구매</li></ul>
						<table style="width:1000px; align: center; border: 1px solid">
							<tr style="align: center; border: 1px solid">
								<th style="width: 150px; text-align: center">상품번호</th>
								<td style="width: 250px">${dto.pdNo}</td>								
								<th style="width: 150px; text-align: center">상품명</th>
								<td style="width: 250px">${dto.pdName}</td>
							</tr>
							<tr style="align: center; border: 1px solid">
								<th style="width: 150px; text-align: center">브랜드</th>
								<td style="width: 250px">${dto.brand}</td>
								<th style="width:200px; text-align: center">이미지</th>
                          		<td align="center">
                          			<img src="${dto.pdImg}" alt="${dto.pdImg}" width="100px" height="100px">                              		
                           		</td>
							</tr>
							<tr style="align: center; border: 1px solid">
								<th style="width: 150px; text-align: center">카테고리</th>
								<td style="width: 250px">${dto.category}									
								</td>
								<th style="width: 150px; text-align: center;">등록일</th>
                           		<td style="width: 200px">${dto.indate}</td>
							</tr>														
							<tr style="align: center; border: 1px solid">
								<th style="width: 150px; text-align: center">가격</th>
								<td style="width: 250px"><span id="total">${dto.price}</span></td>
							
								<th style="width: 150px; text-align: center">* 수량</th>
								<td style="width: 250px">
									<input type="number" name="orderCnt" id="orderCnt" size="20" placeholder="수량을 입력하세요" autofocus required>
								</td>
							</tr>							                    								
							<tr style="align: center; border: 1px solid">   
                        		<td colspan="4" style="width:200px; text-align: center;">
                        			<br><br>
                          			<input type="button" class="Button" value="바로구매" id="insertOrder">
                          			<input type="button" class="Button" value="장바구니" id="insertCart">
                          			<input type="button" class="Button" value="상품목록" id="btnList">
                          			<br><br>
		                        </td>
		                    </tr>
						</table>
						<h3>상세 설명</h3>
						<div class="contents">
							${dto.content}
						</div>
					</form>
				</div>
			</div>	<!-- /section2 -->
   		</div>	<!-- /contents -->
   	</div>	<!-- /container -->   		
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->   
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>   
   <!-- footer 끝 -->

</div>

</body>
</html>