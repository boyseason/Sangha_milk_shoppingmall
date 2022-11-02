<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품목록</title>
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

$(function(){
   $("#btnInsert").click(function(){
      location.href="${path}/productAdd.st";
   });
});

</script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
   <!-- header 끝 -->
   
   <!-- 상품목록 컨텐츠 시작 -->
   	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Product</h1>
			</div>
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<!-- 좌측 메뉴 시작 -->
				<div id="left">
					<div class="left_inside">
						<!-- 좌측 메뉴바 시작 -->
						 <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp"%>					
						<!-- 좌측 메뉴바 종료 -->
					</div>
				</div>
				<!-- 좌측 메뉴 종료 -->
				<!-- 우측 내용 시작 -->
				<div id="right">
					<div class="table_div">
						<table style="width:1000px; align: center">
							<tr align="center">
								<th style="width: 4%">번호</th>
								<th style="width: 6%">브랜드</th>
								<th style="width: 12%">상품명</th>
								<th style="width: 15%">이미지</th>
								<th style="width: 12%">카테고리</th>
								<th style="width: 8%">가격</th>
								<th style="width: 7%">수량</th>
								<th style="width: 7%">상태</th>
								<th style="width: 9%">등록일</th>
								<th style="width: 7%">수정</th>
								<th style="width: 7%">삭제</th>
							</tr>
							
							 <!-- 게시글을 db에서 가져와서 출력할 위치 -->
                     		<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.pdNo}</td>
									<td>${dto.brand}</td>
									<td>${dto.pdName}</td>
									<td>
										<img src="${dto.pdImg}" alt="${dto.pdImg}" width="100px" height="100px">
									</td>
									<td>${dto.category}</td>
									<td>${dto.price}</td>
									<td>${dto.quantity}</td>
									<td>${dto.status}</td>
									<td>${dto.indate}</td>
									<td>
										<input type="button" value="수정" 
										onclick="window.location='${path}/productDetailAction.st?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">										
									</td>
									<td>
										<input type="button" value="삭제"
										onclick="window.location='${path}/productDeleteAction.st?pdNo=${dto.pdNo}'">
									</td>									
								</tr>
							</c:forEach>
							<tr>
								<td colspan="11" align="center">
									<!-- 페이징 처리 --> 
									<!-- 이전버튼 활성화 여부 --> 
									<c:if test="${paging.startPage > 10}">
										<a href="${path}/productList.st?pageNum=${paging.prev}">[이전]</a>
									</c:if> <!-- 페이지 번호 처리 --> <!-- header.css div #right a{ color: black:} 추가 처리 -->
									<c:forEach var="num" begin="${paging.startPage}"
										end="${paging.endPage}">
										<a href="${path}/productList.st?pageNum=${num}">${num}</a>
									</c:forEach> <!-- 다음버튼 활성화 여부 --> <c:if
										test="${paging.endPage < paging.pageCount}">
										<a href="${path}/productList.st?pageNum=${paging.next}">[다음]</a>
									</c:if>
								</td>
							</tr>
							<tr>   
                        		<td colspan="11" align="center">
                          			<input type="button" class="inputButton" value="상품등록" id="btnInsert">
		                        </td>
		                    </tr>
						</table>
					</div>
				</div>
				<!-- 우측 내용 종료 -->
			</div>	<!-- /section2 -->
   		</div>	<!-- /contents -->
   	</div>	<!-- /container -->
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
   
   <%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>
   
   <!-- footer 끝 -->

</div>

</body>
</html>