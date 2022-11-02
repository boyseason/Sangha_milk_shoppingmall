<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<!-- header 시작 -->
	<nav class="navbar">

		<ul class="navbar_title">

		</ul>
		<ul class="navbar_menu">
			<li><a href="${path}/main.do">HOME</a></li>
			<li><a href="${path}/productList.st">Product</a></li>
			<li><a href="${path}/boardList.bo">Board</a></li>
			<li><a href="${path}/memberList.st">Member</a></li>
			<li><a href="${path}/adminOrder.or">Order</a></li>
			<li><a href="${path}/soldView.or">Sold</a></li>
		</ul>

		<ul class="navbar_icons">
			<!-- 로그인 안한 경우 -->
			<c:if test="${sessionScope.customerID == null }">
				<li><a href="${path}/login.do">LOGIN</a></li>
				<li><a href="${path}/join.do">JOIN</a></li>
				<li><a href="${path}/login.do"><i class="fa fa-cart-plus"></i></a></li>
				<li><a href="${path}/login.do"><i class="fa fa-user"></i></a></li>
			</c:if>
			<!-- 로그인 한 경우 -->
			<c:if test="${sessionScope.customerID != null }">
				<li><span style="color: pink">${sessionScope.customerID}</span>님 환영합니다</li>
				<li><a href="${path}/logout.do">LOGOUT</a></li>
				<li><a href="${path}/cartList.cu"><i class="fa fa-cart-plus"></i></a></li>
				<li><a href="${path}/mypage.do"><i class="fa fa-user"></i></a></li>
			</c:if>
		</ul>
		<br>
		<!-- 반응형웹 1. bar 버튼  -->
		<a href="#" class="navbar_toggleBtn"> <i class="fa fa-bars"></i>
		</a>
	</nav>
	<br>
	<!-- header 끝 -->
</body>
</html>