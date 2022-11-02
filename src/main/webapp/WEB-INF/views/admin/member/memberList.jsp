<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 회원목록</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3-3.2 자바 스크립트 이벤트 추가 : 햄버거 버튼 클릭시 아래쪽으로 숨은 메뉴 아이콘 나오도록 main.js에서추가 -->
<%-- <script src="${path}/resources/js/customerJs/main.js" defer></script> --%>
<!-- 참고 defer : 모든 html 파일이 브라우저에 로딩 될 떄 까지 화면에 표시안함. 다 준비되면 그떄 한번에 표시 -->

<script type="text/javascript">


</script>


</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   
   <%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
   
   <!-- header 끝 -->
   
   <!-- 상품목록 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
        <!-- 상단 중앙1 시작 -->
		<div id="section1">
			<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Member</h1>
		</div>
         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <!-- 좌측 메뉴 시작 -->
            <div id="left">
               <div class="left_inside">
                  <!-- 좌측 메뉴바 시작 -->            
                   <%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp"%> 
                  <!-- 좌측 메뉴바 종료 -->
               </div>
            </div>           
            <!-- 좌측 메뉴 종료 -->
            <!-- 우측 내용 시작 -->
            <div id="right">
               <div class="table_div">
                  <table style="width:1000px" align="center">
                     <tr>
            			<th style="width: 10%">아이디</th>
            			<th style="width: 10%">비밀번호</th>
            			<th style="width: 7%">이름</th>
            			<th style="width: 7%">생년월일</th>
            			<th style="width: 15%">주소</th>
            			<th style="width: 10%">휴대폰번호</th>
            			<th style="width: 10%">이메일</th>
            			<th style="width: 10%">가입일</th>
            		</tr>
                     <!--  db에서 가져와서 출력할 위치 -->
                     <c:forEach var="dto" items="${list}">
                     
                        <tr align="center">
                           <td align="center">${dto.id}</td>
                           <td align="center">${dto.password}</td>
                           <td align="center">${dto.name}</td>
                           <td align="center">${dto.birthday}</td>
                           <td align="center">${dto.address}</td>
                           <td align="center">${dto.phone}</td>
                           <td align="center">${dto.email}</td>
                           <td align="center">${dto.regDate}</td>
                        </tr>
                                             
                     </c:forEach>
                     
                     <tr>
                        <td colspan="8" align="center">
                           <!-- 페이징 처리 -->
                           <!-- 이전버튼 활성화 여부 -->
                           <c:if test="${paging.startPage > 10}">
                              <a href="${path}/memberList.bo?pageNum=${paging.prev}">[이전]</a>
                           </c:if>
                           
                           <!-- 페이지 번호 처리 -->
                           <!-- header.css div #right a{ color: black:} 추가 처리 -->
                           <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                              <a href="${path}/memberList.bo?pageNum=${num}">${num}</a>
                           </c:forEach>
                           
                           <!-- 다음버튼 활성화 여부 -->
                           <c:if test="${paging.endPage < paging.pageCount}">
                              <a href="${path}/memberList.bo?pageNum=${paging.next}">[다음]</a>
                           </c:if>
                        </td>
                     </tr>   
                     <tr>   
                        <td colspan="8" align="center">
                           <input type="button" class="inputButton" value="탈퇴 요청" id="">
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
            <!-- 우측 내용 종료 -->
         </div>   <!-- /section2 -->
         </div>   <!-- /contents -->
      </div>   <!-- /container -->
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/admin/common/footer.jsp"%> 
   <!-- footer 끝 -->

</div>

</body>
</html>