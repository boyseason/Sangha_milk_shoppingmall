<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>LOGIN 로그인</title>

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
   
   <!-- UserLoginFailureHandler 에서 msg 넘김 -->
   <c:if test="${errorMsg != null}">
      <script type="text/javascript">
         alert("${errorMsg}");
      </script>
   </c:if>
   
  <!-- 로그인 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Login</h1>
         </div>         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <div id="s2_inner">
               <div class="login">
               	  <!-- 주의 : method="post" 추가할 것, get방식일 경우 _csrf값이 url 뒤에 붙어버리므로 -->
                  <form name="loginform" action="${path}/login_action.do" method="post">               
                  	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                     <table align="center">
                        <colgroup>
                           <col style="width: 150PX;">
                           <col style="width: auto;">
                           <col style="width: auto;">                           
                        </colgroup>
                        <tr>
                           <th>* 아이디</th>
                           <td>
                              <input type="text" class="input" name="id" size="20" placeholder="공백없이 20자 이내로 작성" autofocus required>
                           </td>
                        </tr>
                        
                        <tr>
                           <th>* 비밀번호</th>
                           <td colspan="2">
                           <input type="password" class="input" name="password" size="20" placeholder="비밀번호 입력" required></td>
                        </tr>
                        <tr>
                         <td colspan="3" style="border-bottom: none;">
                            <br>
                            <div align="center">
                               <input type="submit" class="button" value="로그인">
                               <input type="reset" class="button" value="초기화">
                               <input type="button" class="button" value="회원가입" onclick="window.location='${path}/join.do'">
                               <!-- 아이디 찾기, 비밀번호 찾기 기능 추가 -->
                            </div>
                         </td>
                        </tr>
                     </table>
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

</body>
</html>