<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<!-- CSS > cdn : 해당 사이트에서 실시간 다운 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JS -->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- header 시작 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-skyblue">
		<div class="container-fluid">
			<a class="navbar-brand" href="${path}/main.do">
			<i class="fa fa-ice-cream"></i> SangHaFarm </a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${path}/main.do">Home</a></li>
					<li class="nav-item">
						<a class="nav-link" href="${path}/showAll.do">Products</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${path}/showCategory.do">유기농 아이스크림</a></li>
							<li><a class="dropdown-item" href="${path}/showCategory.do">얼려먹는 아이스크림</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="${path}/showCategory.do">더보기</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Board</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${path}/boardList.bo">게시판</a></li>
							<li><a class="dropdown-item" href="${path}/reviewList.bo">Review</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item"href="${path}/board_QnA.bo">Q&A</a></li>
						</ul>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<ul class="navbar_icons">
					<li><i class="fa fa-twitter"></i></li>
					<li><i class="fa fa-facebook"></i></li>
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
			</div>
		</div>
	</nav>
	<header>
		<br>
		<h1 class="site-heading text-center">
			<span class="site-heading-upper text-primary mb-3">
			<img style="width: 200px" src="${path}/resources/css/images/logo.JPG" class="_1QhZSUVBeK" alt="상하목장"></span> 
			<span class="site-heading-lower"></span>
		</h1>
	</header>
	<!-- header 끝 -->
</body>
</html>