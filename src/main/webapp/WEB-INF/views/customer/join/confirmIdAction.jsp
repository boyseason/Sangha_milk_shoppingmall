<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>회원가입 중복확인</title>

<link rel="stylesheet" href="${path}/resources/css/customerCss/confirmIdAction.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

<!-- 3.3 -->
<script src="${path}/resources/js/customerJs/join.js" defer></script>

</head>
<body onload="cofirmIdFocus();">
	
	<form name="confirmform" action="${path}/confirmIdAction.do?${_csrf.parameterName}=${_csrf.token}" method="post"
		onsubmit="return confirmIdCheck();">
		<!-- id 중복 -->
		<c:if test="${selectCnt == 1}">			
			<table style="width: 650px; height: 400px">
				<tr>
					<th colspan="2">
						<span>${id}</span>는 사용할 수 없습니다.
					</th>
				</tr>			
				<tr>
					<th> 아이디 : </th>
					<td>
						<input type="text" class="input" name="id" maxlength="20" 
						style="width:150px;" placeholder="공백없이 15자 이내로 작성" autofocus required>
					</td>
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<input class="input" type="submit" value="확인">
						<input class="input" type="reset" value="취소" onclick="self.close();">
					</td>
				</tr>
			</table>			
		</c:if>
		
		<!-- id 중복 아닐때 -->
		<c:if test="${selectCnt != 1}">
				<table>
					<tr>
						<th colspan="2">
							<span>${id}</span>는 사용할 수 있습니다.
						</th>
					</tr>				
					<tr>
						<th>
							<input class="input" type="button" value="확인" onclick="setId('${id}');">
						</th>
					</tr>
				</table>				
			</c:if>		
	</form>


</body>
</html>