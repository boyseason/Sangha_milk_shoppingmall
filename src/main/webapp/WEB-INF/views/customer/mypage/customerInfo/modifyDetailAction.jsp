<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.pj_117_kys.dto.CustomerDTO" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원정보 수정 상세페이지</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/login.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>
<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>
<!-- 3.3 -->
<script src="${path}/resources/js/customerJs/update.js" defer></script>

</head>
<body onload="updatePWFocus();">

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
                  <form name="updateform" action="${path}/modifyCustomerAction.do" method="post"
                  		onsubmit="return signInCheck();">
                  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  	
            		<!--  회원인증 안하므로 주석 처리 -->
            		<%-- <c:if test="${selectCnt == 1}">     --%>        		
                  	 <!-- 2.1 -->
                  	 <input type="hidden" name="hiddenId" value="0">
                     <table style="align: center; border: 1px solid gray">
                        <colgroup>
                           <col style="width: 150px;">
                           <col style="width: auto;">
                           <col style="width: auto;">                           
                        </colgroup>
                        <tr>
                           <th>* 아이디</th>
                           <td style="border: 1px solid gray">${dto.getId()}</td>
                        </tr>
                        <!-- 비밀번호, 비밀번호 확인에서 value 값 주석처리 > 안하면 암호화된 비밀번호 또 암호화 처리 > 무조건 비밀번호 입력하도록 유도 -->
                        <tr>
                           <th>* 비밀번호</th>
                           <td colspan="2" style="border: 1px solid gray">
                           <input type="password" class="input" name="password" size="20" placeholder="비밀번호 입력 20자 이내" required></td>
                        </tr>
                        
                        <tr>
                           <th>* 비밀번호 확인</th>
                           <td colspan="2" style="border: 1px solid gray">
                           <input type="password" class="input" name="repassword" size="20" placeholder="비밀번호 확인 20자 이내" required></td>
                        </tr>
                        
                        <tr>
                           <th>* 이름</th>
                           <td colspan="2" style="border: 1px solid gray">
                           <input type="text" class="input" name="name" size="20" value="${dto.getName()}" required></td>
                        </tr>
                        
                        <tr>
                           <th>* 생년월일</th>
                           <td colspan="2" style="border: 1px solid gray">
                              <input type="date" class="input" name="birthday" size="8" value="${dto.getBirthday()}" required>
                           </td>
                        </tr>
                        
                        <tr>
                           <th>* 주소</th>
                           <td colspan="2" style="border: 1px solid gray">
                              <input type="text" class="input" name="address" size="60" value="${dto.getAddress()}" required>
                              <!-- 상세주소 입력 : 사이트에서 API 가져올 것 : JSP  -->
                           </td>
                        </tr>
                        <tr>
                           <th>휴대폰 번호</th>
                           <td style="border: 1px solid gray">
                           <!-- 휴대폰 값이 없으면 공백 -->
                           <c:if test="${dto.getPhone() == null}">
                           	  <input type="text" class="input" name="ph1" maxlength="3" style="width:60px">
                              -
                              <input type="text" class="input" name="ph2" maxlength="4" style="width:60px">
                              -
                              <input type="text" class="input" name="ph3" maxlength="4" style="width:60px">     
                           </c:if>
                           <!-- (phone : 'ph1'-'ph2'-'ph3')으로 구성되어 있다
                           		String phone = dto.getPhone();
                    			String[] phArray = phone.split("-");
                            -->
                           <c:if test="${dto.getPhone() != null}">                          		
                    			<c:set var="phArray" value="${fn:split(dto.getPhone(), '-')}"/>
                    		  <input type="text" class="input" name="ph1" value="${phArray[0]}" maxlength="3" style="width:60px">
                              -
                              <input type="text" class="input" name="ph2" value="${phArray[1]}" maxlength="4" style="width:60px">
                              -
                              <input type="text" class="input" name="ph3" value="${phArray[2]}" maxlength="4" style="width:60px">
                           </c:if>                            
                            </td>
                        </tr>
                        <tr>
                           <th>* 이메일</th>
                           <td style="border: 1px solid gray">
                           <!-- 
                           		String email = dto.getEmail();
              					String[] emailArray = email.split("@");
                            -->                          
                           	<c:set var="emailArray" value="${fn:split(dto.getEmail(), '@')}"/>
                           		<input type="text" class="input" name="email1" value="${emailArray[0]}" maxlength="20" style="width:100px" required>
                              @
                              <input type="text" class="input" name="email2" value="${emailArray[1]}" maxlength="20" style="width:100px" required>
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
                         <td colspan="3" style="border: 1px solid gray">
                            <br>
                            <div align="center">
                               <input type="submit" class="button" value="회원수정">
                               <input type="reset" class="button" value="초기화">
                               <input type="button" class="button" value="이전" onclick="history.back();">
                               <!-- history.back(), "window.location='login.do'" -->
                            </div>
                         </td>
                        </tr>
                     </table>                     
                    <%--  </c:if>
                     <!--  회원인증 실패 -->
            		 <c:if test="${selectCnt == 0}">
            			<script type="text/javascript">
            				alert("인증 실패!");
            				window.location="${path}/modifyCustomer.do";
            			</script>            			
            		 </c:if> --%>
                                      
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