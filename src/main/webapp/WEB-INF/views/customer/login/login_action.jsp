<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 처리</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customerCss/login.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3-3-2. 자바스크립트 이벤트 추가: 햄버거 버튼을 클리갛면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->

<!-- defer: 모든 html 파일을 로딩할 때까지 브라우저 창에 나타내는것을 지연하는 역할 -->
<script src="${path}/resources/js/customerJS/main.js" defer></script>

</head>
<body>

<div class="wrap">
	<c:if test="${sessionScope.customerID == 'admin'}">
		<script type="text/javascript"> 
			alert("관리자 로그인");
			window.location="${path}/adminOrder.or";
		</script>
	</c:if>
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 -->
   <div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
           
<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">My Page</h1>
         </div>
         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <div id="s2_inner">
               <div class="join">
                  <form name="loginform" action="${path}/login_action.do" method="post">
                  
                     <!-- 세션이 없는 경우: 첫 진입, 로그인 실패 -->
                     <c:if test="${sessionScope.customerID == null}">
                     	<table>
                              <tr>
                                 <td colspan="2" align="center">
                                    <h3>
                                    	<c:choose>
                                    		<c:when test="${selectCnt == -1}">
                                    			비밀번호가 다릅니다. 다시 확인하세요!
                                    		</c:when>
                                    		<c:when test="${selectCnt == 0}">
                                    			존재하지 않는 아이디입니다. 다시 확인하세요!
                                    		</c:when>                                    		
                                    	</c:choose>                                    	                              
                                    </h3>
                                 </td>
                              </tr>
                              <tr>
                                 <th> 아이디 </th>
                                 <td colspan="2">
                                    <input type="text" class="input" name="id" size="20" placeholder="공백없이 20자 이내로 작성" autofocus required>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <th> 비밀번호 </th>
                                 <td colspan="2">
                                    <input type="password" class="input" name = "password" size="20"  placeholder="공백없이 20자 이내로 작성" autofocus required>
                                 <td/>
                              </tr>
                              <tr>
                                 <td colspan="3" style="border-bottom: none;">
                                    <br>
                                    <div align="right">
                                       <input class="button" type="submit" value="로그인">
                                       <input class="button" type="reset" value="취소">
                                       <input class="button" type="button" value="회원가입" onclick="window.location='${path}/join.do'">
                                    </div>
                                 </td>
                              </tr>
                           </table>
                     </c:if>
                     <c:if test="${sessionScope.customerID != null}">                     
                        <table style="width:800px; border: 1px solid">
                        	<thead>
                           	<tr style="text-align: center">
                              	<th colspan="4" align="center"> 
                                 	<span style="color:#FF84A4;"><b>${sessionScope.customerID}</b></span>님 안녕하세요! 
                              	</th>
                           	</tr>
                           	<tr style="text-align: center">
                           		<th style="width: 10%">성함</th>														
								<th style="width: 12%">주소</th>
								<th style="width: 12%">이메일</th>
								<th style="width: 11%">휴대폰</th>
                           	</tr>
                           </thead>
                           <tbody>
                           		<tr style="text-align: center">
                           			<td style="border: 1px solid">${dto.name}</td>
                           			<td style="border: 1px solid">${dto.address}</td>
                           			<td style="border: 1px solid">${dto.email}</td>
                           			<td style="border: 1px solid">${dto.phone}</td>          
                           		</tr>
                           </tbody>
                        </table>
                        <br><br><br><br><br><br>
						<div align="center">
							<input type="button" class="button" value="구매관리" onclick="window.location='${path}/buyList.or'">
							<input type="button" class="button" value="회원정보 수정" onclick="window.location='${path}/modifyDetailAction.do'">
						</div>
						<br><br>
						<div align="center">     	                 	
							<input type="button" class="button" value="회원탈퇴" onclick="window.location='${path}/deleteCustomer.do'">
							<input type="button" class="button" value="로그아웃" onclick="window.location='${path}/logout.do'">                                 	
						</div>
                     </c:if>
                     <!-- 로그인 컨텐츠 종료 -->
                  </form>
               </div>
            </div> <!-- s2_inner -->
         </div> <!-- section2 -->
      </div> <!-- contents -->
   </div> <!-- container -->
   <!-- 회원가입 컨텐츠 종료 -->
   
   
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</div>
</body>
</html>