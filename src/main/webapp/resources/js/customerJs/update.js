/**
 * 회원가입 validation check
 */
// 필수항목 체크
function signInCheck(){	
	if(!document.updateform.password.value){
		alert("비밀번호를 입력하세요");
		document.updateform.password.focus();
		return false;
	}
	if(!document.updateform.repassword.value){
		alert("비밀번호 확인을 입력하세요");
		document.updateform.repassword.focus();
		return false;
	}
	if(!document.updateform.name.value){
		alert("이름을 입력하세요");
		document.updateform.name.focus();
		return false;
	}
	if(!document.updateform.birthday.value){
		alert("생년월일을 입력하세요");
		document.updateform.birthday.focus();
		return false;
	}
	if(!document.updateform.email1.value || !document.updateform.email2.value){
		alert("이메일을 입력하세요");
		document.updateform.email1.value = "";
		document.updateform.email2.value = "";
		document.updateform.email1.focus();
		return false;
	}
	// 비밀번호 = 비밀번호 확인 체크
	if(document.updateform.password.value != document.updateform.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
		document.updateform.password.value = "";
		document.updateform.repassword.value = "";
		document.updateform.password.focus();
		return false;
	}
}


function updatePWFocus(){
	document.updateform.password.focus();
}

// 이메일 도메인 선택 시 자동생성
function selectEmailChk() {
	
	if (document.updateform.email3.value == 0) {
		document.updateform.email2.value = "";
		document.updateform.email2.focus();
		return false;
	} else if (document.updateform.email3.value) {
		document.updateform.email2.value = document.updateform.email3.value;
		return false;
	}
}