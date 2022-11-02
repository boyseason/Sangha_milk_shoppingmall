<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중복확인 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">
<!-- 에러페이지 아직 안 만들어서 주석 처리 -->
<%-- <script src="${path}/resources/js/customerJS/errorMsg.js"></script> --%>

</head>
<body>
   <c:if test="${insertCnt == 0}">
      <script type="text/javascript">
      // errorAlert("이메일 인증 실패!!");
         alert("이메일 인증에 실패했습니다");
         window.location="login.do";
      </script>
   </c:if>
   
   <c:if test="${insertCnt != 0}">
      <script type="text/javascript">
      // errorAlert("이메일 인증 실패!!");
         alert("이메일 인증에 성공했습니다 로그인 해주시기 바랍니다");
         window.location="login.do";
      </script>
   </c:if>
</body>
</html>