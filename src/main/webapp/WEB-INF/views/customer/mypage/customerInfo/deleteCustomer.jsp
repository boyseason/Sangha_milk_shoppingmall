<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 탈퇴 - 인증</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/login.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3-3-2. 자바스크립트 이벤트 추가: 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->

<!-- defer: 모든 html 파일을 로딩할 때까지 브라우저 창에 나타내는것을 지연하는 역할 -->
<script src="${path}/resources/js/customerJS/main.js" defer></script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   
   <!-- 회원 탈퇴 컨텐츠 시작 -->
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
                  <form name="passwordform" action="${path}/deleteCustomerAction.do" method="post">
                     <%
                        String customerID = (String)request.getSession().getAttribute("customerID");

                      %>
                     <table>
                        <colgroup>
                           <col style="width:80px">
                           <col style="width:80px">
                        </colgroup>
                        <tr>
                           <th colspan="2">
                             	 회원탈퇴를 위해 <span style="color:#FF82AA;"><%= customerID %></span>님의 비밀번호를 입력하세요.
                           </th>
                        </tr>
                        
                        <tr>
                           <th> 비밀번호 </th>
                           <td colspan="2" style="border: 1px solid gray">
                              <input type="Password" class="input" name="password" size="20"  placeholder="공백없이 20자 이내로 작성" required>
                           <td/>
                        </tr>
                        
                        
                        <tr>
                           <td colspan="3" style="border-bottom: none">
                              <br>
                              <div align="center">
                                 <input type="submit" class="button" value="회원탈퇴">
                                 <input type="button" class="button" value="취소" onclick="window.location='${path}/main.do'">
                              </div>
                           </td>
                        </tr>
                     </table>
                  </form>
               </div>
            </div> <!-- s2_inner -->
         </div> <!-- section2 -->
      </div> <!-- contents -->
   </div> <!-- container -->
   <!-- 회원 탈퇴 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
      
</div>

</body>
</html>