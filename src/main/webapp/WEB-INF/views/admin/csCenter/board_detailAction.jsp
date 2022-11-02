<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 게시판</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>


<script type="text/javascript">
$(function(){	//페이지가 로딩되면
	comment_list();	//바로 댓글목록까지 호출
	
	// 댓글쓰기 버튼 클릭
	$('#btnSave').click(function(){
		comment_add();
	});
	
	// 목록 버튼이 클릭될 시 이벤트 발생
	$("#btnList").click(function(){
		location.href="${path}/boardList.bo";
	});
	
	// 수정삭제 화면으로 이동 > 시큐리티 추가 > ?${_csrf.parameterName}=${_csrf.token}
	$("#btnEdit").click(function(){
		document.detailForm.action="${path}/password_chk.bo";
	    document.detailForm.submit();
	});
});

// 댓글쓰기 > url에 ?${_csrf.parameterName}=${_csrf.token} 추가
function comment_add(){
	var param={
		"board_num": ${dto.num},
		"comment_writer": $('#comment_writer').val(),
		"content": $('#content').val()
	}
	$.ajax({
		url: "${path}/commentAdd.bo?${_csrf.parameterName}=${_csrf.token}",
		type: "POST",
		data: param,
		success: function(){	
			$('#comment_writer').val("");	
			$('#content').val("");
			comment_list();	
		},
		error: function(){
			alert('comment_add 오류');
			comment_list();
		}
	});
}

//댓글목록 > url에 ?${_csrf.parameterName}=${_csrf.token} 추가
function comment_list(){
	$.ajax({
		url: "${path}/commentList.bo?${_csrf.parameterName}=${_csrf.token}",
		type: "post",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		},
		error: function(){
			alert("comment_list() 에러");
		}
	});
}

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
					<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Board Detail</h1>
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
							<form method="post" name="detailForm">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<table style="width: 1000px" align="center" border="1">
									<tr>
										<th style="width: 150px">번호</th>
										<td style="width: 250px">${dto.num}</td>									
										<th style="width: 150px">조회수</th>
										<td style="width: 250px">${dto.readCnt}</td>										
									</tr>

									<tr>
										<th style="width: 150px">작성자</th>
										<td style="width: 250px">${dto.writer}</td>

										<th style="width: 150px">비밀번호</th>
										<td style="width: 250px">
											<input type="password" class="input" name="password"
											id="password" size="20" value="${dto.password}" placeholder="비밀번호 입력" required> 
											<c:if test="${param.message=='error'}">
												<br>
												<span style="color: red">비밀번호가 일치하지 않습니다</span>
											</c:if>
										</td>
									</tr>
									<tr>
										<th style="width: 150px">글제목</th>
										<td style="width: 250px">${dto.title}</td>
										<th style="width: 150px">작성일</th>
										<td style="width: 250p">${dto.regDate}</td>
									</tr>

									<tr>
										<th style="width: 150px">글내용</th>
										<td colspan="3">${dto.content}</td>
									</tr>

									<tr>
										<th colspan="4">
											<!-- 화면에 표시는X, 글번호값을 넘기기 위해 hidden타입으로 넘김 -->
											<input type="hidden" name="num" value="${dto.num}">											
											<input type="button" class="inputButton" value="수정/삭제" id="btnEdit"> 
											<input type="button" class="inputButton" value="목록" id="btnList">
										</th>
									</tr>
								</table>
							</form>

							<!-- 댓글 입력 코드 -->
							<br>
							<br>
							<table style="width: 1000px" align="center" border="1">
								<tr>
									<th colspan="4" align="center">댓 글</th>
								</tr>
								<tr>
									<th style="width: 180px; height: 30px;">이름</th>
									<td style="width: 180px; height: 30px;">
										<input type="text" class="input" name="comment_writer" id="comment_writer" placeholder="이름">
									</td>									
									<td style="width: 80px" rowspan="2">
										<button id="btnSave" type="button">확인</button>
									</td>
								</tr>
								<tr>
									<th style="width: 180px; height: 30px;">내용</th>
									<td>
										<textarea style="width: 740px" rows="5" cols="60" name="content" id="content" placeholder="내용을 입력하세요."></textarea>
									</td>
								</tr>
							</table>

							<br><br>
							<!-- 댓글 목록을 출력할 영역 -->
							<div id="commentList">
								댓글 목록을 출력할 영역
							</div>
						</div>
					</div>
					<!-- 우측 내용 종료 -->
				</div>
				<!-- /section2 -->
			</div>
			<!-- /contents -->
		</div>
		<!-- /container -->
	<!-- 컨텐츠 종료 -->

	<!-- footer 시작 -->
   	<%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>
    <!-- footer 끝 -->

</div>

</body>
</html>	