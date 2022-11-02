/**
 * 회원가입 validation check
 */
// 필수항목 체크
function signInCheck(){
	if(!document.joinform.id.value){
		alert("아이디를 입력하세요");
		document.joinform.id.focus();
		return false;
	}
	if(!document.joinform.password.value){
		alert("비밀번호를 입력하세요");
		document.joinform.password.focus();
		return false;
	}
	if(!document.joinform.repassword.value){
		alert("비밀번호 확인을 입력하세요");
		document.joinform.repassword.focus();
		return false;
	}
	if(!document.joinform.name.value){
		alert("이름을 입력하세요");
		document.joinform.name.focus();
		return false;
	}
	if(!document.joinform.birthday.value){
		alert("생년월일을 입력하세요");
		document.joinform.birthday.focus();
		return false;
	}
	if(!document.joinform.email1.value || !document.joinform.email2.value){
		alert("이메일을 입력하세요");
		document.joinform.email1.value = "";
		document.joinform.email2.value = "";
		document.joinform.email1.focus();
		return false;
	}
	// 비밀번호 = 비밀번호 확인 체크
	if(document.joinform.password.value != document.joinform.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
		document.joinform.password.value = "";
		document.joinform.repassword.value = "";
		document.joinform.password.focus();
		return false;
	}
	
	
	
	// 2-1 join.jsp에서 form 아래에 추가
 	//<input type="hidden" name="hiddenId" value="0">
	// hiddenId : 중복확인 버튼 클릭여부 체크 ( 0 : 클릭 X / 1 : 클릭 O )
	
	
	// 2-2 중복확인 버튼 클릭하지 않았으면 알림창 "중복확인을 확인하세요"
	if(document.cofirmform.hiddenId.value == 0){
		alert("중복확인을 확인하세요");
		document.cofirmform.dupChk.focus();
		return false;
	}
}

// 아이디 중복 확인 > 중복확인 페이지 open
function confirmIdCheck(){
	if(!document.joinform.id.value){
		alert("아이디를 입력하세요");
		document.joinform.id.focus();
		return false;
	}
	var url = "/pj_117_kys/confirmIdAction.do?id=" + document.joinform.id.value;
	// window.open(경로, 창 이름, 스타일);
	window.open(url, "confirm", "menubar=no, width=650, height=400");
}

// 이동 시 아이디로 자동 이동
function confirmIdFocus(){
	document.cofirmform.id.focus();
}
function joinIdFocus(){
	document.joinform.id.focus();
}


// 이메일 도메인 선택 시 자동생성
function selectEmailChk() {
	if (document.joinform.email3.value == 0) {
		document.joinform.email2.value = "";
		document.joinform.email2.focus();
		return false;
	} else if (document.joinform.email3.value) {
		document.joinform.email2.value = document.joinform.email3.value;
		return false;
	}
}

/*
 * 자식 창에서 부모 창으로 id 전달
 * opener : window 객체의 open() 메서드로 열린 새 창(= 중복 확인창)에서 부모(join)으로 접근할 때 사용
 */
function setId(id){ // 아이디가 중복이 아닌 경우 아이디 확정
	opener.document.joinform.id.value = id;
	opener.document.joinform.hiddenId.value = "1"; // 중복확인 버튼 클릭 체크
	self.close();
}