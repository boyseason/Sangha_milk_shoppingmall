<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카테고리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3-3.2 자바 스크립트 이벤트 추가 : 햄버거 버튼 클릭시 아래쪽으로 숨은 메뉴 아이콘 나오도록 main.js에서추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- defer : 모든 html 파일이 브라우저에 로딩 될 떄 까지 화면에 표시안함. 다 준비되면 그떄 한번에 표시 -->
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
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <!-- header 끝 -->
   
   <!-- 상품목록 컨텐츠 시작 -->
   	<div id="container">
   		<div id="contents">
			<!-- 상단 중앙1 시작 -->
			<div id="section1">
				<h1 style="font-family: 'Gowun_Batang', serif; align: center">Product Category</h1>
			</div>
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">	
				<!-- 우측 내용 시작 -->
				<div id="right">
					<div class="table_div">
						<table style="width:1000px" align="center">
							<tr>
								<th colspan="4">* 카테고리</th>
								<td colspan="8">
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
                        		<td colspan="11" align="center">
                        			<input type="submit" class="inputButton" value="보기" id="btnView">
                          			<input type="button" class="inputButton" value="등록" id="btnInsert">
                          			<input type="button" class="inputButton" value="삭제" id="btnDelete">
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
   
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   
   <!-- footer 끝 -->

</div>

</body>
</html>