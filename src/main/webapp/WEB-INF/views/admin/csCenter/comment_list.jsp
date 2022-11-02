<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 게시판 댓글 목록</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3-3.2 자바 스크립트 이벤트 추가 : 햄버거 버튼 클릭시 아래쪽으로 숨은 메뉴 아이콘 나오도록 main.js에서추가 -->
<%-- <script src="${path}/resources/js/customerJs/main.js" defer></script> --%>
<!-- 참고 defer : 모든 html 파일이 브라우저에 로딩 될 떄 까지 화면에 표시안함. 다 준비되면 그떄 한번에 표시 -->

</head>
<body>
	<form method="post" name="commentForm">
	<table border="1" width="1000px" align="center">
      <c:forEach var="dto" items="${list}"> 
         <tr>
            <th width="180px"> ${dto.writer} </th>
            <td style="text-align:left; padding-left:20px;"> ${dto.content} </td>
            <td width="80px" style="font-size:12px"> ${dto.reg_date}</td>
         </tr>	
      </c:forEach>
   	</table>
	</form>
	

</body>
</html>