<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 삭제 처리</title>
</head>
<body>
<script>
</script>    
	<!-- delete 성공 -->
	<c:if test="${deleteCnt ==  1}">
		<script type="text/javascript">
			alert("선택하신 상품이 구매 목록에서 삭제되었습니다 ");
			window.location="${path}/buyList.or";
		</script>
	</c:if>
	<!-- delete 실패 -->
	<c:if test="${deleteCnt ==  0}">
		<script type="text/javascript">
			alert("구매 목록에서 삭제하는데 실패했습니다 ");
			window.location="${path}/buyList.or";
		</script>
	</c:if>
</body>
</html>