<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>left Menu</title>
</head>
<body>
	<!-- 좌측메뉴바 시작 -->
	<ul class="menubarLeft">
		<li><h3>관리자 메뉴</h3></li>
		<hr>
		<li>
			<h4>재고 관리</h4>
			<ul class="product_menu">
				<li><a href="${path}/productList.st">상품목록</a></li>
				<li><a href="${path}/productAdd.st">상품등록</a></li>
				<li><a href="${path}/productCategory.st">카테고리</a></li>
			</ul>
		</li>
		<li>
			<h4><a href="${path}/adminOrder.or">주문 관리</a></h4>
		</li>
		<li>
			<h4>회원 관리</h4>
			<ul class="member_menu">
				<li><a href="${path}/memberList.do">회원목록</a></li>
				<li><a href="${path}/memberWithdraw.do">탈퇴요청</a></li>
			</ul>
		</li>
		<li>
			<h4><a href="${path}/boardList.bo">게시판목록</a></h4>
		</li>
		<li>
			<h4><a href="${path}/reviewList.bo">리뷰 관리</a></h4>
		</li>
		<li>
			<h4><a href="${path}/soldView.or">결산</a></h4>
		</li>
		<li><h4><a href="${path}/logout.do">로그아웃</a></h4></li>
	</ul>
	<!-- 좌측메뉴바 종료 -->

</body>
</html>