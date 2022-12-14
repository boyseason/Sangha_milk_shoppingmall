package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_kys.dto.CustomerDTO;
import spring.mvc.pj_117_kys.util.SettingValues;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Autowired
    SqlSession sqlSession; // dataSource-config.xml 커넥션풀  + 마이바티스 	(pom.xml) 필요
	
	DataSource dataSource; 	
	// dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_117");
		
	
	// id 중복확인 처리
	@Override
	public int idCheck(String strId) {
		System.out.println("dao : 중복확인 처리");
		// 1건 : selectOnt, 다수 : selectList 메서드 사용
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.idCheck", strId);
		
		return selectCnt;
	}
	
	// password와 암호화된 비밀번호 일치 확인
	@Override
	public String passwordCheck(String strId){
		System.out.println("dao : 중복확인 처리");
		String encryptPassword = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.passwordCheck", strId);
		
		return encryptPassword;
	}
	
	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("dao : 회원가입 처리");			
		// customerMapper.xml에서 호출		
		int intsertCnt = sqlSession.insert("spring.mvc.pj_117_kys.dao.CustomerDAO.insertCustomer", dto);
		
		return intsertCnt;
		// return sqlSession.insert("spring.mvc.pj_117.dao.CustomerDAO.insertCustomer", dto);
	}
	
	// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	@Override
	public void sendEmail(String email, String key) {

		final String username = SettingValues.ADMIN; // 네이버 이메일 ID : @naver.com은 입력하지 않는다.
		final String password = SettingValues.PW; // 네이버 비밀번호 :
		final String host = "smtp.naver.com"; // Google일 경우 smtp.gmail.com
		int port = 465; // 포트번호

		// 메일 내용
		String recipient = "dbfldj801@naver.com"; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "회원가입 인증 메일"; // 메일 제목 입력해주세요.

		String content = "회원가입을 축하드립니다. 링크를 눌러 회원가입을 완료하세요." + "<a href='http://localhost/pj_117_kys/emailChkAction.do?key="
				+ key + "'>링크</a>";

		Properties props = System.getProperties();

		// 정보를 담기 위한 객체 생성
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug

		try {
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("dbfldj801@naver.com")); 
			// 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일주소를 다 작성해주세요.
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅
			mimeMessage.setSubject(subject); // 제목셋팅
			// mimeMessage.setText(body); //내용셋팅
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
			System.out.println("<<<< Email SEND >>>>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 회원정보 인증 [아이디 비밀번호]
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("dao : 회원정보 인증 처리");
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.idPasswordChk", map);

		return selectCnt;
	}
	
	// 회원탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		System.out.println("dao : 회원탈퇴 처리");
		int deleteCnt = sqlSession.delete("spring.mvc.pj_117_kys.dao.CustomerDAO.deleteCustomer", strId);
		
		return deleteCnt;
	}
	
	// 회원 상세 페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("dao : 회원정보 상세페이지");
		
		// id = ?인 회원의 정보 전체를 가져오려고 한다 > DTO에 모든 정보 담기
		CustomerDTO dto = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.getCustomerDetail", strId);
		
		return dto;
	}
	
	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("dao : 회원정보 수정 처리");		
		int updateCnt = sqlSession.update("spring.mvc.pj_117_kys.dao.CustomerDAO.updateCustomer", dto);
			
		return updateCnt;
	}
	
	// 시큐리티 : 로그인 전 이메일 인증을 해야 한다.
	@Override
	public int selectKey(String key) {
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.selectKey", key);
		return selectCnt;
	}

	// 시큐리티 : 로그인 전 이메일 인증을 해야 하며, 1로 수정
	@Override
	public int updateGrade(String key) {
		int updateCnt = sqlSession.update("spring.mvc.pj_117_kys.dao.CustomerDAO.updateGrade", key);
		return updateCnt;
	}
}
