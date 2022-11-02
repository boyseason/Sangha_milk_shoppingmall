package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_kys.dto.BoardCommentDTO;
import spring.mvc.pj_117_kys.dto.BoardDTO;

public interface BoardDAO {
	 
	// 게시글 목록 (ArrayList 큰바구니 다형성 적용)
	public List<BoardDTO> boardList(Map<String, Object> map);
		
	// 게시글 갯수 구하기
	public int boardCnt();
	
	// 게시글 작성 처리
	public int boardInsert(BoardDTO dto);

	// 게시글 조회수 증가
	public void plusReadCnt(int num);
	
	// 게시글 상세페이지	(게시글 번호 일치 시)
	public BoardDTO getBoardDetail(int num);

	// 비밀번호 인증
	public String password_chk(Map<String, Object> map);
		
	// 게시글 수정 처리		
	public void boardUpdate(BoardDTO dto);
	
	// 게시글 삭제 처리
	public void boardDelete(int num);

	// 댓글 추가 처리
	public void commentInsert(BoardCommentDTO dto);

	// 댓글 목록 처리		
	public List<BoardCommentDTO> commentList(int board_num);
}
