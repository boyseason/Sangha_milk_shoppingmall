<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 등록처리</title>
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
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- header 끝 -->
		<c:if test="${insertCnt == 0}">
 			<script type="text/javascript">
 				alert("결제에 실패하였습니다");
 				window.history.back();
 			</script>
 		</c:if>
      		
 		<!-- insert 성공 -->
 		<c:if test="${insertCnt == 1}">
 			<script type="text/javascript">
 				alert("결제가 완료되었습니다.");
 				window.location="${path}/buyList.or";
 			</script>
 		</c:if>



      <!-- footer 시작 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      <!-- footer 끝 -->
   </div>
</body>
</html>