<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원정보 수정 처리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/login.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>
<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
</head>
<body >

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Customer Info</h1>
         </div>         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <div id="s2_inner">
               <div class="join">
                  <form name="updateform" action="${path}/modifyDetailAction.do" method="post">
                  
                  <c:if test="${updateCnt == 0}"> <!-- 회원수정 실패 -->
                  	<script type="text/javascript">
                  		alert("회원정보 수정에 실패했습니다");
                  		window.location="${path}/mypage.do";               	 			          
                  	</script>   
                  </c:if>
                  <c:if test="${updateCnt != 0}"> <!-- 회원수정 성공 -->
                  <%
                  	request.getSession().invalidate(); // 회원정보 수정되었으니 세션 삭제
                  %>
                  	<script type="text/javascript">
                  		setTimeout(function(){                  				
                  			alert("회원정보가 수정되었습니다 다시 로그인해주세요");
                  			window.location="${path}/login.do";
                  		}, 1000); // 1초 후에 이동                
                  	</script>
                  </c:if>  
                  </form>
               </div> <!-- join -->  
            </div> <!-- s2_inner -->
         </div> <!-- sections -->
      </div> <!-- contents -->
   </div> <!-- container -->
   <!-- 컨텐츠 종료 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</div>
<br><br><br><br>
</body>
</html>