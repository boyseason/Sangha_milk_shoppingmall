<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원가입 폼 </title>

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
<body onload="joinIdFocus();">

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Join</h1>
         </div>         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <div id="s2_inner">
               <div class="join">
                  <form name="joinform" action="${path}/join_action.do" method="post" 
                  		onsubmit="return signInCheck();">
                  	 <!-- form에 method="post" 여부 확인 후 csrf 추가 -->
                  	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  	 <input type="hidden" name="hiddenId" value="0">
                     <table>
                        <colgroup>
                           <col style="width: 150px;">
                           <col style="width: auto;">
                           <col style="width: auto;">                           
                        </colgroup>
                        <tr>
                           <th>* 아이디</th>
                           <td>
                              <input type="text" class="input" name="id" size="20" placeholder="공백없이 20자 이내로 작성">
                              <input type="button" name="dupchk" value="중복확인 " style="margin-left: 10px;" 
                              	onclick="confirmIdCheck();">
                           </td>
                        </tr>
                        
                        <tr>
                           <th>* 비밀번호</th>
                           <td colspan="2">
                           <input type="password" class="input" name="password" size="20" placeholder="비밀번호 입력"></td>
                        </tr>
                        
                        <tr>
                           <th>* 비밀번호 확인</th>
                           <td colspan="2">
                           <input type="password" class="input" name="repassword" size="20" placeholder="비밀번호 확인"></td>
                        </tr>
                        
                        <tr>
                           <th>* 이름</th>
                           <td colspan="2">
                           <input type="text" class="input" name="name" size="20" placeholder="이름 입력"></td>
                        </tr>
                        
                        <tr>
                           <th>* 생년월일</th>
                           <td colspan="2">
                              <input type="date" class="input" name="birthday" size="8" placeholder="생년월일 8자리">
                           </td>
                        </tr>
                        
                        <tr>
                           <th>* 주소</th>
                           <td colspan="2">
                              <input type="text" class="input" name="address" size="60" placeholder="주소지 입력">
                              <!-- 상세주소 입력 : 사이트에서 API 가져올 것 : JSP  -->
                           </td>
                        </tr>
                        <tr>
                           <th>휴대폰 번호</th>
                           <td>
                              <input type="text" class="input"   name="ph1" maxlength="3" style="width:60px">
                              -
                              <input type="text" class="input"   name="ph2" maxlength="4" style="width:60px">
                              -
                              <input type="text" class="input"   name="ph3" maxlength="4" style="width:60px">
                           </td>
                        </tr>
                        <tr>
                           <th>* 이메일</th>
                           <td>
                              <input type="text" class="input" name="email1" maxlength="20" style="width:100px" placeholder="이메일 입력">
                              @
                              <input type="text" class="input" name="email2" maxlength="20" style="width:100px">
                              <select class="input" name="email3" style="width:100px" onchange="selectEmailChk();">
                                 <option value= "0">직접 입력</option>
                                 <option value= "naver.com">naver.com</option>
                                 <option value= "gmail.com">gmail.com</option>
                                 <option value= "daum.net">daum.net</option>
                                 <option value= "nate.com">nate.com</option>                              
                              </select>
                           </td>
                        </tr>
                        <tr>
                         <td colspan="3" style="border-bottom: none;">
                            <br>
                            <div align="center">
                               <input type="submit" class="button" value="회원가입">
                               <input type="reset" class="button" value="초기화">
                               <input type="button" class="button" value="가입취소" onclick="window.location='login.do'">
                               <!-- history.back(), "window.location='login.do'" -->
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