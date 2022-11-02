<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원가입 처리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/join.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>
<!-- 3.3-2 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- 3.3 -->
<script src="${path}/resources/js/customerJs/join.js" defer></script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 --> 
   <!-- insertCnt가 1이면 성공 0이면 실패 -->
   <c:if test="${insertCnt == 0}">
   		<script type="text/javascript">
   			setTimeout(function(){
				alert("회원가입에 실패하였습니다.");
				window.location="${path}/join.do";
			}, 1000);
		</script>
   </c:if> 
  
   <c:if test="${insertCnt == 1}">
   		<script type="text/javascript">
   			alert("회원가입에 성공하였습니다.");
		</script>
   		<c:redirect url="mainSuccess.do?insertCnt=${insertCnt}" /> 
   </c:if>
   <!-- 컨텐츠 종료 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</div>

</body>
</html>