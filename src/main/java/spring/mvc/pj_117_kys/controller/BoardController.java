package spring.mvc.pj_117_kys.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_kys.dao.BoardDAO;
import spring.mvc.pj_117_kys.dto.BoardDTO;
import spring.mvc.pj_117_kys.service.BoardServiceImpl;


@Controller
public class BoardController {
	@Autowired
    BoardServiceImpl service;
	
	@Autowired
	BoardDAO dao;
	
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);		
		
	// 관리자 로그인 > 게시판 메뉴
    @RequestMapping("boardList.bo") 
    public String boardList(HttpServletRequest req, Model model) 
    		throws ServletException, IOException {
    	logger.info("[url > boardList.bo]");
						
		service.boardListAction(req, model);
		return "admin/csCenter/boardList";
	} 
    
    // 게시글 쓰기
    @RequestMapping("board_insert.bo")
    public String board_insert(){			
    	logger.info("[url > board_insert.bo]");
			
		return "admin/csCenter/board_insert";			
    }		
    
    // 게시판 글쓰기 처리
    @RequestMapping("board_insertAction.bo")
    public String board_insertAction(HttpServletRequest req, HttpServletResponse res, Model model) 
    		throws ServletException, IOException {			
    	logger.info("[url > board_insertAction.bo]");
			
		service.boardInsertAction(req, model);
		String viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
		return null;
	} 
    
    // 게시글 상세보기 
    @RequestMapping("board_detailAction.bo")
    public String board_detailAction(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{ 
		logger.info("[url > board_detailAction.bo]");
			
		service.boardDetailAction(req, model);
		return "admin/csCenter/board_detailAction";	
	} 
    
    // 수정 삭제 시 비밀번호 인증 
    @RequestMapping("password_chk.bo")
    public String password_chk(HttpServletRequest req, HttpServletResponse res, Model model) 
    throws ServletException, IOException{			
    	logger.info("[url > password_chk.bo]");
			
		String result = service.password_chkAction(req, model);
		int num = Integer.parseInt(req.getParameter("num")); // hidden num
		
		// 비밀번호 일치 > 수정/삭제 화면			
		if(result != null) {
			// 수정 화면은 상세페이지에서 input box로 변형된 상태로 구현
			BoardDTO dto = dao.getBoardDetail(num);
			// jsp로 처리 결과 전달
			model.addAttribute("dto", dto);			
			return "admin/csCenter/board_edit";
				
		} else {
		// 비밀번호 불일치 > 이전 화면
			logger.info("비밀번호 불일치");
			String viewPage =  req.getContextPath() + "/board_detailAction.bo?num=" + num 
					+ "&message=error";
			res.sendRedirect(viewPage);
			return null;
		}   	
	} 
    
    // 게시글 수정 
    @RequestMapping("board_updateAction.bo")
    public String board_updateAction(HttpServletRequest req, HttpServletResponse res, Model model) 
    		throws ServletException, IOException{ 
		logger.info("[url > board_updateAction.bo]");
			
		int num = Integer.parseInt(req.getParameter("num")); // hidden num
		service.boardUpdateAction(req, model);
		
		String viewPage = req.getContextPath() + "/board_detailAction.bo?num=" + num;
		res.sendRedirect(viewPage);
		return null;
		
	} 
    
    // 게시글 삭제
    @RequestMapping("board_deleteAction.bo")
    public String board_deleteAction(HttpServletRequest req, HttpServletResponse res, Model model) 
    		throws ServletException, IOException{			
		logger.info("[url > board_deleteAction.bo]");
			
		service.boardDeleteAction(req, model);
		
		String viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
		return null;
	} 
	
    // ----------------- 댓글 -----------------------
	// 댓글 작성
    @RequestMapping("commentAdd.bo")
    public String commentAdd(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{			
    	logger.info("[url > commentAdd.bo]");
			
		service.commentAddAction(req, model);
		// board_detailAction.jsp 아래에서 comment_list.jsp 출력
		return "admin/csCenter/comment_list";
	} 
    
    // 댓글 목록 
    @RequestMapping("commentList.bo")
    public String commentList(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{			
			logger.info("[url > commentList.bo]");
			
		service.commentListAction(req, model);
			
		// board_detailAction.jsp 아래에서 comment_list.jsp 출력
		return "admin/csCenter/comment_list";			
	}
}

