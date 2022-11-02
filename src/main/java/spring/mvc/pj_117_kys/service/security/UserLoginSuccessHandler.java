package spring.mvc.pj_117_kys.service.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.mvc.pj_117_kys.dto.UserVO;

//로그인 성공시 작동 
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//security-context.xml에서 매개변수 생성자 sqlSession 생성 후 매개변수로 전달
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("<<< UserLoginSuccessHandler - onAuthenticationSuccess 진입 >>>");

		UserVO vo = (UserVO) authentication.getPrincipal();
		System.out.println("UserVO : " + vo.getUsername());

		String msg = authentication.getName() + "님 환영합니다.";

		String authority = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.authorityCheck",
				authentication.getName());

		request.setAttribute("msg", msg);
		request.getSession().setAttribute("customerID", authentication.getName()); // 세션추가
		request.getSession().setAttribute("authority", authority);

		int grade = 0;
		if (authority.equals("ROLE_USER")) { // 유저
			grade = 1;
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main.do");
			dispatcher.forward(request, response);
		} else { // 관리자
			grade = 0;
			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminOrder.or");
			dispatcher.forward(request, response);
		}

	}

}
