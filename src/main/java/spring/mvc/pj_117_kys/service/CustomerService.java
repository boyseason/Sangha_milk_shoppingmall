package spring.mvc.pj_117_kys.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CustomerService {
	// 비즈니스 로직 > 서비스 접근
	// 중복 확인 처리
	public void confirmIdAction(HttpServletRequest req, Model model);
	
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
	
	// 로그인 처리
	public void loginAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 탈퇴 처리
	public void deleteCustomerAction(HttpServletRequest req, Model model);
	
	// 회원정보 인증 및 상세 페이지
	public void modifyDetailAction(HttpServletRequest req, Model model);
	
	// 회원정보 수정 처리
	public void modifyCustomerAction(HttpServletRequest req, Model model);
	
	// 이메일 인증
	public void emailChkAction(HttpServletRequest req, Model model);
}
