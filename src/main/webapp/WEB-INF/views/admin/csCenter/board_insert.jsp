<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>게시글 쓰기</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 자바스크립트 이벤트 추가 : 햄버거 버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<!-- defer : 모든 html 파일을 로딩할 때가지 html이 브라우저창에 표시가 안 되는 것을 방지 -->
<script src="${path}/resources/js/customerJs/main.js" defer></script>

<script>
	$(function(){
		// 목록 버튼 클릭 시 게시판 목록으로 이동
		$("#btnList").click(function(){
			location.href="${path}/boardList.bo";
		});
		// 작성 버튼 클릭 시 게시글 쓰기
		$("#btnInsert").click(function(){
			// validation check
			var writer = $("#writer").val();
			var password = $("#password").val();
			var title = $("#title").val();
			var content = $("#content").val();
			
			if(!writer){
				alert("작성자를 입력하세요")
				$("#writer").focus();
				return false;
			}else if(!password){
				alert("비밀번호를 입력하세요")
				$("#password").focus();
				return false;
			} else if(!title){
				alert("제목을 입력하세요")
				$("#title").focus();
				return false;
			} else if(!content){
				alert("내용을 입력하세요")
				$("#content").focus();
				return false;
			}		
			
			// <form action="">을 jQuery에서 설정
			document.insertForm.action = "${path}/board_insertAction.bo";
			document.insertForm.submit(); // 값 전송
		});		
	});
</script>
</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
   <!-- header 끝 -->
   
   <!-- 컨텐츠 시작 -->
	<div id="container">
      <div id="contents">
         <!-- 상단 중앙1 시작 -->
         <div id="section1">
            <h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Board Insert</h1>
         </div>         
         <!-- 상단 중앙2 시작 -->
         <div id="section2">
            <!-- 좌측메뉴 시작 -->           
            <div id="left">
            	<div class="Left_inside">
            		<!-- 좌측메뉴바 시작 -->
            		<%@ include file="/WEB-INF/views/admin/common/leftMenu.jsp" %>          		 	
            		<!-- 좌측메뉴바 종료 -->
            	</div>
            </div>
            <!-- 좌측메뉴 종료 -->
            
            <!-- 우측메뉴 시작 -->
            <div id="right">
            	<div class="table_div">
            	<form name="insertForm" method="post">
            		<table style="width: 1000px" align="center">
            			<tr>        				
            				
            				<th style="width:150px">작성자</th>
            				<td>
            					<input type="text" style="width:300px" class="input" name="writer" id="writer" size="20" placeholder="작성자 입력" required>
            				</td>
            				
            				<th style="width:150px">비밀번호</th>
            				<td>
            					<input type="password" style="width:300px" class="input" name="password" id="password" size="20" placeholder="비밀번호 입력" required>
            				</td>
            			</tr>
            			<tr>
            				<th style="width:150px; text-align:center">제목</th>
            				<td colspan="5" style="width:650px; text-align:center">
            					<input type="text" class="input" name="title" id="title" size="50" placeholder="제목 입력" required>
            				</td>
            			</tr>
            			<tr>
            				<th style="width:150px">내용</th>
            				<td colspan="5" style="width:650px; text-align:center">
            					<textarea rows="5" cols="93" class="input" name="content" id="content" placeholder="내용 입력" required></textarea>
            				</td>
            			</tr>
            			<tr>
            				<td colspan="6" align="center"> <!-- type이 button이어야 JQuery문 정상작동 -->
            					<input type="hidden" name="num" value="${dto.num}">
            					<input type="button" class="inputButton" value="작성" id="btnInsert">
            					<input type="reset" class="inputButton" value="초기화">
            					<input type="button" class="inputButton" value="목록" id="btnList"> 
            				</td>            				
            			</tr>
            		</table>
            	</form>
            	</div>
            </div>
            <!-- 우측메뉴 종료 -->
         </div> <!-- sections -->
      </div> <!-- contents -->
   </div> <!-- container -->
   <!-- 컨텐츠 종료 -->

   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/admin/common/footer.jsp" %>
   <!-- footer 끝 -->


</div>

</body>
</html>