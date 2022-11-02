<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품목록</title>
<!-- 반응형웹 적용 -->
<meta name="viewpoint" content="width=device-width, initial-scale=1">

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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">All Product</h1>
			</div>			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">			
				<div class="table_div">
						<table style="width:1000px; align: center; border: 1px solid gray">
							<tr align="center">								
								<th style="width: 5%">번호</th>
								<th style="width: 12%">상품명</th>
								<th style="width: 15%">이미지</th>
								<th style="width: 12%">카테고리</th>
								<th style="width: 8%">가격</th>
								<th style="width: 7%">수량</th>
								<th style="width: 7%">상태</th>
								<th style="width: 9%">등록일</th>
								<th style="width: 7%">구매</th>								
							</tr>
							
							 <!-- 게시글을 db에서 가져와서 출력할 위치 -->
                     		<c:forEach var="dto" items="${list}">
								<tr style="align: center; border: 1px solid">
									<td>${dto.pdNo}</td>
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
										<input type="button" value="구매" 
										onclick="window.location='${path}/showDetailAction.do?pdNo=${dto.pdNo}'">										
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
						</table>
				</div>				
			</div>	<!-- /section2 -->
   		</div>	<!-- /contents -->
   	</div>	<!-- /container -->
	<!-- 컨텐츠 종료 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->


</div>

</body>
</html>