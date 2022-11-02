<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 카테고리</title>

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
   $("#btnView").click(function(){
      location.href="${path}/productCategory.st";
  	});
   $("#btnInsert").click(function(){
	      location.href="${path}/categoryAdd.st";
	});
   $("#btnDelete").click(function(){
	      location.href="${path}/categoryDel.st";
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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Product Category</h1>
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
						<form method="post" name="categoryForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<table style="width:1000px" align="center">
							<tr>
								<th colspan="3">* 카테고리</th>
								<td colspan="6">
									<select class="input" id="category" name="category" required>
										<option value="유기농 아이스크림" selected>유기농 아이스크림</option>
										<option value="얼려먹는 아이스크림">얼려먹는 아이스크림</option>
									</select>
								</td>
							</tr>
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
								</tr>
							</c:forEach>
							<tr>   
                        		<td colspan="9" align="center">
                        			<input type="submit" class="inputButton" value="보기" id="btnView">
                          			<input type="button" class="inputButton" value="등록" id="btnInsert">
                          			<input type="button" class="inputButton" value="삭제" id="btnDelete">
		                        </td>
		                    </tr>
						</table>
						</form>
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