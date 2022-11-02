<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품등록</title>
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>main</title>

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

</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
		<!-- header 끝 -->

		<!-- 컨텐츠 시작 -->
		<div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Product Add</h1>
         </div>
         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <!-- 좌측메뉴 시작 -->
            <div id="left">
            	<div class="Left_inside">
            		<!-- 좌측메뉴바 시작 -->
            		<%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>          		 	
            		<!-- 좌측메뉴바 종료 -->
            	</div>
            </div>
            <!-- 좌측메뉴 종료 -->
			<div id="right">
				<div class="table_div">
				<form action="${path}/productAddAction.st?${_csrf.parameterName}=${_csrf.token}" method="post" name="productAdd" enctype="multipart/form-data">
					<table style="width: 800px" align="center" border="1">
						<tr>
							<th>* 브랜드</th>
							<td>
								<input type="text" class="input" id="brand "name="brand" size="50" value="상하목장" required>
							</td>
						</tr>
						<tr>
							<th>* 상품명</th>	
							<td>
								<input type="text" class="input" id="pdName" name="pdName" size="40" placeholder="상품명 입력" required autofocus>
							</td>
						</tr>

						<tr>
							<th>* 이미지</th>
							<td>
								<input type="file" class="input" id="pdImg" name="pdImg" accept="image/*">
							</td>
						</tr>

						<tr>
							<th>* 상품 카테고리</th>
							<td>
								<select id="category" name="category" class="input" required>
									<option>상품 카테고리</option>
									<option value="유기농 아이스크림">유기농 아이스크림</option>
									<option value="얼려먹는 아이스크림">얼려먹는 아이스크림</option>								
								</select>
							</td>
						</tr>
						<tr>
							<th>상품 설명</th>
							<td>
								<textarea rows="5" cols="50" id="content" name="content" placeholder="제품 설명 입력"></textarea>		
							</td>
						</tr>
						<tr>
							<th>* 판매가</th>
							<td>
								<input type="number" class="input" id="price" name="price" size="10" placeholder="판매가 입력" required>
							</td>
						</tr>
						<tr>
							<th>* 등록수량</th>
							<td>
								<input type="number" class="input" id="quantity" name="quantity" size="10" placeholder="등록수량 입력" required>
							</td>
						</tr>

						<tr>
							<th>* 판매상태</th>
							<td>
								<select class="input" id="status" name="status" required>
									<option>상품 판매상태</option>
									<option value="판매중" selected>판매중</option>
									<option value="품절">품절</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2"><br>
								<div align="center">
									<input type="submit" class="button" value="등록"> 
									<input type="reset" class="button" value="초기화">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- 우측 내용 종료 -->
	</div>
	<!-- /section2 -->
	</div>
	<!-- /contents -->
	</div>
	<!-- /container -->
	<!-- 컨텐츠 종료 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->


</div>

</body>
</html>