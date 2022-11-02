package spring.mvc.pj_117_kys.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_117_kys.dao.CustomerDAO;
import spring.mvc.pj_117_kys.dto.CustomerDTO;
import spring.mvc.pj_117_kys.util.EmailChkHandler;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
    CustomerDAO dao;
	
	// 비밀번호 암호화 클래스
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// --------------- [ 회원가입  ]---------------
	// id 중복확인
	@Override
	public void confirmIdAction(HttpServletRequest req, Model model) {
		System.out.println("service : 중복확인 처리");
		// 화면으로 부터 입력받은 값을 받는다
		String strId = req.getParameter("id");
				
		// id 중복확인 처리 (DAO에서 DB 처리)
		int selectCnt = dao.idCheck(strId);
		
		// jsp로 결과 전달 : model.addAttribute
		// selectCnt 1이면 아이디 존재, 0이면 사용가능한 아이디
		model.addAttribute("id", strId);
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// 회원가입 시큐리티 (암호화된 비밀번호 추가, 이메일 인증키 추가, 가입성공 시 이메일 인증 추가)
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		System.out.println("service : 회원가입 처리");
		
		// 화면으로 부터 입력받은 값을 받는다
		CustomerDTO dto = new CustomerDTO();
		dto.setId(req.getParameter("id"));
		
		// 비밀번호 암호화 - 시큐리티
	    String password = req.getParameter("password");
	    System.out.println("암호화 전의 비밀번호 : " + password);
	   
	    // BCryptPasswordEncoder.encode() : 비밀번호 암호화 메서드
	    String encryptPassword = passwordEncoder.encode(password);
	    System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
	      
	    dto.setPassword(encryptPassword);   // setPassword(암호화된 비밀번호); 
		dto.setRepassword(req.getParameter("repassword"));
		dto.setName(req.getParameter("name"));
		// 년-월-일 형식
		// Date date = Date.valueof(req.getParameter("birthday"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));
		// phone은 not null이 아니므로 값이 존재할 때만 처리한다
		String phone = "";
		String strPhone1 = req.getParameter("ph1"); // 010 처음
		String strPhone2 = req.getParameter("ph2"); // 1111 중간
		String strPhone3 = req.getParameter("ph3"); // 2222 끝
		// ph1 ph2 ph3가 null이 아니면
		if(!strPhone1.equals("") && !strPhone2.equals("") && !strPhone3.equals("")) {
			phone = strPhone1 + "-" + strPhone2 + "-" + strPhone3; // 010-1111-2222
		}
		dto.setPhone(phone);
		
		String strEmail1 = req.getParameter("email1"); // 아이디
		String strEmail2 = req.getParameter("email2"); // 도메인
		String email = strEmail1 + "@" + strEmail2; // 아이디@도메인		
		dto.setEmail(email);		
		// regDate는 테이블에서 이미 default sysdate 설정해놓았다
		// 아래는 Timestamp로 직접 값을 설정하는 문구
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		// 시큐리티
	    String key = EmailChkHandler.getKey();
	    dto.setKey(key);		
		
		//회원가입 처리 (DAO에서 DB 처리)
		int insertCnt = dao.insertCustomer(dto);
		System.out.println("service inserCnt : " + insertCnt);
		// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	    if(insertCnt == 1) {
	       dao.sendEmail(email, key);   // email은 네이버 이메일   
	    }
		// jsp로 결과 전달 : model.addAttribute
		// insertCnt 1이면 회원가입 성공, 0이면 회원가입 실패
		model.addAttribute("insertCnt", insertCnt);	
	}
	
	// --------------- [ 로그인  ]---------------
	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		System.out.println("service : 로그인 처리");
		// 화면으로 부터 입력받은 값을 받는다
		String strId = req.getParameter("id");
		String strPassword = 
				req.getParameter("password");
		
		// Map<String, Object> value는 다형성을 위해 Object형으로 생성
		Map<String, Object> map = new HashMap<String, Object>();
		// map.put("key", value);
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		
		// id 중복확인 처리 (DAO에서 DB 처리)
		int selectCnt = dao.idPasswordChk(map);
		// selectCnt를 비밀번호까지 따로 인증하여 0 1 -1로 하려면 
		// 1) dao.idChk(String strId)하고 selectCnt 1, 0일 때 
		// 2) selectCnt가 1일 때 dao.passwordChk(String strPassword) 호출하여 selectCnt 반환받고 1, 0 처리
		
		// selectCnt 1 : 로그인 성공
		if(selectCnt == 1) { // session ID 설정
			HttpSession session = req.getSession();
			session.setAttribute("customerID", strId);
			// req.getSession().setAttribute("customerID", strId); // key : customerID 
		}
		// jsp로 결과 전달 model.addAttribute
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// --------------- [ 회원탈퇴  ]---------------
	@Override
	public void deleteCustomerAction(HttpServletRequest req, Model model) {
		System.out.println("service : 회원정보 인증 및 탈퇴 처리");
		// 화면으로 부터 입력받은 값을 받는다
		String strId = (String) req.getSession().getAttribute("customerID");
		String strPassword = req.getParameter("password");

		String encryptPassword = dao.passwordCheck(strId);
		System.out.println("암호화 되어있는 비밀번호 : " + encryptPassword);

		int selectCnt = 0;
		int deleteCnt = 0;
		if (passwordEncoder.matches(strPassword, encryptPassword)) {
			selectCnt = 1;
			deleteCnt = dao.deleteCustomer(strId);
			System.out.println("deleteCnt : " + deleteCnt);
		}

		// 6단계. jsp로 처리 결과 전달
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);

//		// 화면으로 부터 입력받은 값을 받는다
//		String strId = (String)req.getSession().getAttribute("customerID");
//		String strPassword = req.getParameter("password");
//		System.out.println("id : " + strId + ", pw : " + strPassword);
//		
//						
//		// 회원정보 인증 및 탈퇴 처리 (DAO에서 DB 처리)		
//		Map<String, Object> map = new HashMap<String, Object>();	
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		
//		int selectCnt = dao.idPasswordChk(map);
//		
//		int deleteCnt = 0;
//		if(selectCnt == 1) { // 회원일 경우에만
//			// 탈퇴 처리
//			deleteCnt = dao.deleteCustomer(strId);	
//		}		
//		// jsp로 결과 전달 model.addAttribute
//		model.addAttribute("deleteCnt", deleteCnt);
//		model.addAttribute("selectCnt", selectCnt);
	}
	
	// --------------- [ 회원수정 ]---------------	
	// 회원정보 수정 - 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, Model model) {
		System.out.println("service : 회원정보 상세");
		String strId = (String)req.getSession().getAttribute("customerID");
		
		CustomerDTO dto = dao.getCustomerDetail(strId);		
		model.addAttribute("dto", dto);		
//		
//		// 화면으로 부터 입력받은 값을 받는다
//		// session에 있는 id, 화면 password를 가져온다
//		String strId = (String)req.getSession().getAttribute("customerID"); 
//		String strPassword = req.getParameter("password");		
//		
//		
//		// 회원정보 인증
//		Map<String, Object> map = new HashMap<String, Object>();	
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		
//		int selectCnt = dao.idPasswordChk(map);
//		
//		CustomerDTO dto = new CustomerDTO();
//		if(selectCnt == 1) {
//		// 회원수정 상세페이지
//			dto = dao.getCustomerDetail(strId);
//		}
//		// jsp로 결과 전달 : model.addAttribute		
//		model.addAttribute("selectCnt", selectCnt);
//		model.addAttribute("dto", dto);		
	}
	
	// 회원정보 수정 처리 - 시큐리티(비밀번호 암호화)
	@Override
	public void modifyCustomerAction(HttpServletRequest req, Model model) {
		System.out.println("service : 회원정보 수정 처리");
		
		CustomerDTO dto = new CustomerDTO();
		// id는 세션(로그인한 id)으로부터 가져온다
		dto.setId((String)req.getSession().getAttribute("customerID"));
		
		// 비밀번호 암호화 
	    String password = req.getParameter("password");
	    String encryptPassword = passwordEncoder.encode(password);
	    System.out.println("암호화 전의 비밀번호 : " + password + ", 암호화 후의 비밀번호 : " + encryptPassword);
	      
	    // 암호화된 비밀번호를 setter로 담는다.
	    dto.setPassword(encryptPassword);		
		dto.setRepassword(encryptPassword);
		dto.setName(req.getParameter("name"));
		// 년-월-일 형식
		// Date date = Date.valueof(req.getParameter("birthday"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));
		// phone은 not null이 아니므로 값이 존재할 때만 처리한다
		String phone = "";
		String strPhone1 = req.getParameter("ph1"); // 010 처음
		String strPhone2 = req.getParameter("ph2"); // 1111 중간
		String strPhone3 = req.getParameter("ph3"); // 2222 끝
		// ph1 ph2 ph3가 null이 아니면
		if(!strPhone1.equals("") && !strPhone2.equals("") && !strPhone3.equals("")) {
			phone = strPhone1 + "-" + strPhone2 + "-" + strPhone3; // 010-1111-2222
		}
		dto.setPhone(phone);
		
		String strEmail1 = req.getParameter("email1"); // 아이디
		String strEmail2 = req.getParameter("email2"); // 도메인
		String email = strEmail1 + "@" + strEmail2; // 아이디@도메인		
		dto.setEmail(email);
		
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		// 회원정보 수정 처리		
		int updateCnt = dao.updateCustomer(dto);
		
		// jsp로 결과 전달 : model.addAttribute
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 이메일 인증 후 권한(enabled) update - 시큐리티
	@Override
	public void emailChkAction(HttpServletRequest req, Model model) {
		 String key = req.getParameter("key");
	      int selectCnt = dao.selectKey(key);
	      
	      if(selectCnt == 1) {
	         int insertCnt = dao.updateGrade(key);
	         model.addAttribute("insertCnt", insertCnt);
	      }		
	}

}
