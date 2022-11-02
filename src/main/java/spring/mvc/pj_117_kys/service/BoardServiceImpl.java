package spring.mvc.pj_117_kys.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import page.Paging;
import spring.mvc.pj_117_kys.dao.BoardDAO;
import spring.mvc.pj_117_kys.dto.BoardCommentDTO;
import spring.mvc.pj_117_kys.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;
	
	// 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 게시글 목록");	
		// 화면으로 부터 입력받은 값을 받는다
		// 페이지 번호 클릭 시
		String pageNum = req.getParameter("pageNum");		
		Paging paging = new Paging(pageNum);
		
		// 전체 게시글 갯수 카운트 > paging에 총 갯수 설정 > 처음 글, 마지막 글, 페이지 갯수 설정
		int totalCnt = dao.boardCnt();
		System.out.println("totalCnt : " + totalCnt);		
		paging.setTotalCount(totalCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow(); 
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("start", start);
		map.put("end", end);
		
		// 게시글 목록
		List<BoardDTO> list = null;
		if(totalCnt > 0) {
			list = dao.boardList(map);
		}
				
		// jsp로 결과 전달 : model.addAttribute
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 게시글 작성 처리
	@Override
	public void boardInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 게시글 작성");
		
		// 화면으로 부터 입력받은 값을 받는다 (dto)
		BoardDTO dto = new BoardDTO();
		dto.setWriter(req.getParameter("writer"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPassword(req.getParameter("password"));
		System.out.println(dto.getWriter() + ", " + dto.getPassword() + ", " + dto.getTitle() + ", " + dto.getContent());	
		
		// 글쓰기 처리
		int insertCnt = dao.boardInsert(dto);
		
		// jsp로 결과 전달 : model.addAttribute
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 게시글 상세페이지");	
		// 화면으로 부터 입력받은 값을 받는다 (게시글번호 num)
		int num = Integer.parseInt(req.getParameter("num"));		
		
		System.out.println("게시글 번호 : " + num);
		
		// 조회수 증가
		dao.plusReadCnt(num);
		// 상세 페이지
		BoardDTO dto = dao.getBoardDetail(num);
		
		// jsp로 결과 전달 : model.addAttribute
		model.addAttribute("dto", dto);
	}
	
	// 비밀번호 인증
	@Override
	public String password_chkAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 비밀번호 인증");	
		// 화면으로 부터 입력받은 값을 받는다 (hidden num, password)
		int num = Integer.parseInt(req.getParameter("num"));
		String password = req.getParameter("password");
		System.out.println("글번호 : " + num + ", 비밀번호 : " + password);
		
		// 비밀번호 인증
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("num", num);
		map.put("password", password);
		String result = dao.password_chk(map);
		
		return result;
	}
	
	// 게시글 수정 처리
	@Override
	public void boardUpdateAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 게시글 수정 처리");	
		// 화면으로 부터 입력받은 값을 받는다 (hidden num, password)
		// mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPassword(req.getParameter("password"));
		
		dao.boardUpdate(dto);
	}
	
	// 게시글 삭제 처리
	@Override
	public void boardDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : 게시글 삭제 처리");	
		// 화면으로 부터 입력받은 값을 받는다 (hidden num, password)
		int num = Integer.parseInt(req.getParameter("num"));
			
		dao.boardDelete(num);
	}

	// 댓글 추가 처리
	@Override
	public void commentAddAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : commentAddAction");

		// 3단계. 화면으로부터 입력받은 값을 받는다. 
		BoardCommentDTO dto = new BoardCommentDTO();
		
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		dto.setWriter(req.getParameter("comment_writer"));
		dto.setContent(req.getParameter("content"));			
		
		// 5단계. 댓글 작성 후 리스트로 이동
		dao.commentInsert(dto);
		
		// 실행이 끝나면 board_detailAction.jsp의 comment_add() 콜백함수(success)로 넘어감	
	}

	// 댓글목록 처리
	@Override
	public void commentListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service : commentAddAction");

		int board_num = Integer.parseInt(req.getParameter("num"));
		System.out.println("board_num : " + board_num);

		List<BoardCommentDTO> list = new ArrayList<BoardCommentDTO>();
				
		// 5단계. 댓글 목록 조회
		list = dao.commentList(board_num);

		// jsp로 결과 전달 setAttribute
		model.addAttribute("list", list);
		// 실행이 끝나면 board_detailAction.jsp의 comment_add() 콜백함수(success)로 넘어감	
	}
}
