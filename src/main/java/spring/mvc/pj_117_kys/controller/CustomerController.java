package spring.mvc.pj_117_kys.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_kys.service.CustomerServiceImpl;
import spring.mvc.pj_117_kys.service.ProductServiceImpl;


@Controller
public class CustomerController {
	@Autowired
    CustomerServiceImpl service;
	
	@Autowired
	ProductServiceImpl service_p;
	
    private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
    
    // main
    @RequestMapping("main.do")
    public String main() {
       logger.info("[url > /main.do]");
       
       return "common/main";
    }
    
    // 회원가입
    @RequestMapping("join.do")
    public String join() {
       logger.info("[url > join.do]");
       
       return "customer/join/join";
    }
    
    // 아이디 중복확인
    @RequestMapping("confirmIdAction.do")
    public String confirmIdAction(HttpServletRequest req, Model model) {
       logger.info("[url > confirmIdAction.do]");
       
       service.confirmIdAction(req, model);
       return "customer/join/confirmIdAction";
    }
    
    // 회원가입 처리 - 비밀번호 암호화(시큐리티)
    @RequestMapping("join_action.do")
    public String join_action(HttpServletRequest req, Model model) {
       logger.info("[url > join_action.do]");
       
       service.signInAction(req, model);
       return "customer/join/join_action";
    }
    
    // 회원가입 성공
    @RequestMapping("mainSuccess.do")
    public String mainSuccess(HttpServletRequest req, Model model) {
        logger.info("[url > mainSuccess.do]");
        
        int cnt = Integer.parseInt(req.getParameter("insertCnt"));
		model.addAttribute("cnt", cnt);
        return "customer/login/login";
    }
    
    
    // 로그인
    @RequestMapping("login.do")
    public String login() {
       logger.info("[url > login.do]");
       
       return "customer/login/login";
    }
    
    // 로그인 처리 login_action.do  > 컨트롤러가 아닌 시큐리티에서 처리하므로 주석 처리 
// UserAuthenticationService(성공,실패,거부)
    @RequestMapping("mypage.do")
    public String login_action(HttpServletRequest req, Model model) {
       logger.info("[url > mypage.do]");
       service.modifyDetailAction(req, model);
       return "customer/login/login_action";
   }
    
    // 로그아웃
    @RequestMapping("logout.do")
    public String logout(HttpServletRequest req) {
       logger.info("[url > logout.do]");
       
       req.getSession().invalidate(); // 세션 삭제
       return "common/main";
    }
    
    // 회원탈퇴
    @RequestMapping("deleteCustomer.do")
    public String deleteCustomer() {
       logger.info("[url > deleteCustomer.do]");
      
       return "customer/mypage/customerInfo/deleteCustomer";
    }
    
    // 회원탈퇴 처리
    @RequestMapping("deleteCustomerAction.do")
    public String deleteCustomerAction(HttpServletRequest req, Model model) {
       logger.info("[url > deleteCustomerAction.do]");
       
       service.deleteCustomerAction(req, model);
       return "customer/mypage/customerInfo/deleteCustomerAction";
    }
    
    // 회원수정 회원인증
//    @RequestMapping("modifyCustomer.do")
//    public String modifyCustomer() {
//       logger.info("[url > modifyCustomer.do]");
//       
//       return "customer/mypage/customerInfo/modifyCustomer";
//    }
    
    // 회원수정 상세페이지
    @RequestMapping("modifyDetailAction.do")
    public String modifyDetailAction(HttpServletRequest req, Model model) {
       logger.info("[url > modifyDetailAction.do]");
  
       service.modifyDetailAction(req, model);
       return "customer/mypage/customerInfo/modifyDetailAction";
    }
    
    // 회원수정 처리 - 시큐리티(비밀번호 암호화)
    @RequestMapping("modifyCustomerAction.do")
    public String modifyCustomerAction(HttpServletRequest req, Model model) {
       logger.info("[url > modifyCustomerAction.do]");
       
       service.modifyCustomerAction(req, model);
       return "customer/mypage/customerInfo/modifyCustomerAction";
    }
    
    // 시큐리티 - 가입성공시 이메일인증을 위해 이메일 인증 후 enabled 권한을 1로 update
    // CustomerDAOImpl의 sendEmail(String email, String key)에서 호출
    @RequestMapping("emailChkAction.do")
    public String emailChk(HttpServletRequest req,  Model model) {
       logger.info("[url > emailChkAction.do]");
       
       service.emailChkAction(req, model);
       return "customer/join/emailChkAction";
    } 
    
    // 모든 상품 출력
    @RequestMapping("showAll.do")
    public String showAll(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > showAll.do]");
						
		service_p.productList(req, model);
		return "customer/product/showAll";			
	}
    
    // 카테고리 출력
    @RequestMapping("showCategory.do")
    public String showCategory(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > showCategory.do]");
						
		service_p.productCategory(req, model);
		return "customer/product/showCategory";			
	}   
    
    // 상품 상세페이지 
    @RequestMapping("showDetailAction.do")
    public String showDetailAction(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > showDetailAction.do]");
						
		service_p.productDetailAction(req, model);
		return "customer/product/showDetail";			
	}   
    
 }
