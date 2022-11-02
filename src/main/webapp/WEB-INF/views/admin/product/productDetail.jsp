<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 - 상품 상세</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/adminCss/admin.css">

<script src="https://kit.fontawesome.com/bb9e081823.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
   	$("#btnList").click(function(){
      	location.href="${path}/productList.st";
   	});
   
   $("#btnUpdate").click(function(){
		// validation check
		var pdName = $("#pdName").val();
		var brand = $("#brand").val();
		var category = $("#category").val();
		var price = $("#price").val();
		var quantity = $("#quantity").val();
		var status = $("#status").val();
		
		if(!pdName){
			alert("상품명을 입력하세요")
			$("#pdName").focus();
			return false;
		} else if(!brand){
			alert("브랜드를 입력하세요")
			$("#brand").focus();
			return false;
		} else if(!category){
			alert("카테고리를 입력하세요")
			$("#category").focus();
			return false;
		} else if(!price){
			alert("가격을 입력하세요")
			$("#price").focus();
			return false;
		} else if(!quantity){
			alert("수량을 입력하세요")
			$("#quantity").focus();
			return false;
		} else if(!status){
			alert("상태를 입력하세요")
			$("#status").focus();
			return false;
		}
		
		document.editForm.action="${path}/productUpdateAction.st?${_csrf.parameterName}=${_csrf.token}";
		document.editForm.submit();
	});
});
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
				<h1 style="font-family: 'Gowun_Batang', serif; text-align: center">Product Detail</h1>
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
					<form method ="post" name="editForm" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<!-- hidden : input 태그에서 직접 입력받지 못한 값 전달할 때 사용 -->
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="hiddenPdNo" value="${dto.pdNo}">
						<input type="hidden" name="hiddenPdImg" value="${dto.pdImg}"> <!-- 기존상품 이미지 -->
						<input type="hidden" name="indate" value="${dto.indate}">
						
						<table style="width:1000px" align="center">
							<tr align="center">
								<th style="width: 150px">상품번호</th>
								<td style="width: 250px; text-align: center">${dto.pdNo}</td>								
								<th style="width: 150px">* 상품명</th>
								<td style="width: 250px; text-align: center">
									<input type="text" name="pdName" id="pdName" size="20" value="${dto.pdName}" autofocus>
								</td>
							</tr>
							<tr>
								<th style="width: 150px">* 브랜드</th>
								<td style="width: 250px; text-align: center">
									<input type="text" name="brand" id="brand" size="20" value="${dto.brand}">
								</td>
								<th style="width:200px;">* 이미지</th>
                          		<td align="center">
                          			<img src="${dto.pdImg}" alt="${dto.pdImg}" width="100px" height="100px">
                              		<!-- 상품 이미지는 input type을 반드시 "file"로 줄 것, accept에는 이미지 폴더-->
                              		<input type="file" class="input" name="pdImg" id="pdImg" value="${dto.pdImg}" accept="image/*">
                           		</td>
							</tr>
							<tr>
								<th style="width: 150px">* 카테고리</th>
								<td style="width: 250px">
									<div>
										<select name="category" id="category" style="width: 200px">
											<option value="카테고리 선택">카테고리</option>
											<option <c:if test="${dto.category == '유기농 아이스크림'}">selected</c:if> value="유기농 아이스크림">유기농 아이스크림</option>
											<option <c:if test="${dto.category == '얼려먹는 아이스크림'}">selected</c:if> value="얼려먹는 아이스크림">얼려먹는 아이스크림</option>										
										</select>
									</div>
								</td>
								<th style="width: 150px">등록일</th>
                           		<td style="width: 200px; text-align: center">
                              		${dto.indate}
                           		</td>
							</tr>
							<tr>
                           		<th style="width: 150px">상세설명</th>
                           		<td colspan="3" style="text-align:center;">
                              		<textarea rows="5" cols="93" name="content" id="content">${dto.content}</textarea>
                              		<!-- name은 req.getParmeter를 위해서필요, id는 제이쿼리를 적용시키기 위해 필요함 -->
                           		</td>
	                        </tr>								
							<tr>
								<th style="width: 150px">* 가격</th>
								<td style="width: 250px">
									<input type="text" name="price" id="price" size="20" value="${dto.price}">
								</td>
							
								<th style="width: 150px">* 수량</th>
								<td style="width: 250px">
									<input type="text" name="quantity" id="quantity" size="20" value="${dto.quantity}">
								</td>
							</tr>
							<tr>
                           		<th style="width: 150px">* 상태 </th>
                           		<td colspan="3">
                              		<div>
                                		<select id="status" name="status" style="width:200px">
                                    		<option <c:if test="${dto.status == '판매중'}">selected</c:if> value="판매중">판매중</option>
                                    		<option <c:if test="${dto.status == '품절'}">selected</c:if> value="품절">품절</option>
                                 		</select>
                              		</div> 
                           		</td>
                       		</tr>                       								
							<tr>   
                        		<td colspan="4" style="width:200px">
                          			<input type="button" class="inputButton" value="상품수정" id="btnUpdate">
                          			<input type="button" class="inputButton" value="상품목록" id="btnList">
		                        </td>
		                    </tr>
						</table>
					</form>
					</div>
				</div>
				<!-- 우측 내용 종료 -->
			</div>	<!-- /section2 -->
   		</div>	<!-- /contents -->
   	</div>	<!-- /container -->
   <!-- 컨텐츠 종료 -->
   
   <!-- footer 시작 -->
   
   <%@ include file="/WEB-INF/views/admin/common/footer.jsp"%>
   
   <!-- footer 끝 -->

</div>

</body>
</html>