<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품등록처리</title>
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>main</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때가지 html이 브라우저창에 표시가 안 되는 것을 방지 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<!-- header 끝 -->
		<!-- insert 실패 -->
		<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				alert("상품 등록에 실패했습니다");
				window.location="${path}/productList.st";
			</script>

		</c:if>
		<!-- insert 성공 -->
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("상품 등록에 성공했습니다");
				window.location="${path}/productList.st";
			</script>
		</c:if>
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center">상품 등록 처리</h1>
				</div>

				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측메뉴 시작 -->
					<div id="left">
						<div class="Left_inside">
							<!-- 좌측메뉴바 시작 -->
							<%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp"%>
							<!-- 좌측메뉴바 종료 -->
						</div>
					</div>
					<!-- 좌측메뉴 종료 -->
					<div id="right">
						<div class="table_div">
							<form method="post" name="productAdd"
								enctype="multipart/form-data">
								<table style="width: 800px" align="center" border="1">
									<tr>
										<th>결과</th>
										<td><c:if test="${insertCnt == 1}">
												<a href="${path}/productList.st">[상품 등록 성공]</a>
											</c:if> <c:if test="${insertCnt == 0}">
												<a href="${path}/productList.st">[상품 등록 실패]</a>
											</c:if>
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