package spring.mvc.pj_117_kys.dao;

import java.util.Map;

import spring.mvc.pj_117_kys.dto.CustomerDTO;

public interface CustomerDAO {
	// id 중복확인 처리
	public int idCheck(String strId);
	
	// password 확인
	public String passwordCheck(String strId);
	
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	public void sendEmail(String email, String key);
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);
	
	// 회원탈퇴 처리
	public int deleteCustomer(String strId);
	
	// 회원 상세 페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
	// 시큐리티 : 로그인 전 이메일 인증을 해야 하며, 1로 수정
	// 시큐리티
	public int selectKey(String key);
	   
	// 시큐리티
	public int updateGrade(String key);
}
