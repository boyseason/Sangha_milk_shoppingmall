<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원 탈퇴 처리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/login.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>
<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
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
            <h1 align="center">회원 탈퇴 인증</h1>
         </div>         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <div id="s2_inner">
               <div class="join">
                  <form name="passwordform" method="post">
                  	<%-- <c:if test="${selectCnt == 1}"> <!-- 아이디 비밀번호 일치 --> --%>
                  		<c:if test="${deleteCnt == 0}">
                  			<script type="text/javascript">
                  	 		alert("회원탈퇴에 실패했습니다"); 
                  	 		window.location="${path}/deleteCustomer.do";
                  	 		</script>
                  		</c:if>
                  		<c:if test="${deleteCnt != 0}">
                  		<%
                  			request.getSession().invalidate(); // 모든 세션 삭제
                  		%>
                  			<script type="text/javascript">
                  	 			setTimeout(function(){
                  	 				alert("회원탈퇴 처리되었습니다");
                  	 				window.location="${path}/main.do"; // 메인으로
                  	 			}, 1000); // 1초 후에 이동                
                  	 		</script>
                  		</c:if>
                  <%-- 	</c:if>
                  	<c:if test="${selectCnt != 1}"> <!-- 아이디 비밀번호 불일치 -->
                  		<script type="text/javascript">
                  	 		alert("아이디 비밀번호가 일치하지 않습니다"); 
                  	 		window.location="${path}/deleteCustomer.do";
                  	 	</script>
                  	</c:if>      --%>             
                  </form>
               </div> <!-- join -->  
            </div> <!-- s2_inner -->
         </div> <!-- sections -->
      </div> <!-- contents -->
   </div> <!-- container -->
   <!-- 컨텐츠 종료 -->
   <br><br><br><br><br><br><br><br>
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->


</div>
<br><br><br><br>
</body>
</html>