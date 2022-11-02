package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_kys.dto.BoardCommentDTO;
import spring.mvc.pj_117_kys.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
    SqlSession sqlSession;
	
	// 커넥션 풀 데이터 자료 보관 dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_117");
	DataSource dataSource;	
	
	// 게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("dao : boardList");
		// dto 1건에 대한 selectOne > list에 add(dto) > selectList
		// 1) sqlSession.selectList
		// List<BoardDTO> list = sqlSession.selectList("spring.mvc.pj_117_kys.dao.BoardDAO.boardList", map);
		
		
		// 2) sqlSession.getMapper
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.boardList(map);
			
		return list;
	}
	
	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println("dao : boardCnt");
		// String sql = "SELECT count(*) as cnt FROM mvc_board_tbl";
		
		// 1) sqlSession.selectOne
		//int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.BoardDAO.boardCnt");		
		
		// 2) sqlSession.getMapper
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int selectCnt = dao.boardCnt();
		return selectCnt;
		
		
	}

	// 게시글 작성
	@Override
	public int boardInsert(BoardDTO dto) {
		System.out.println("dao : boardInsert");					
		// String sql = "INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate) "
		//			+ "VALUES((SELECT NVL(max(num)+1, 1) FROM mvc_board_tbl), ?, ?, ?, ?, 0, sysdate)";
		
		// 1) sqlSession.insert
		//int insertCnt = sqlSession.insert("spring.mvc.pj_117_kys.dao.BoardDAO.boardInsert", dto);
		
		// 2) sqlSession.getMapper
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int insertCnt = dao.boardInsert(dto);
		
		return insertCnt;
	}

	// 조회수 증가
	@Override
	public void plusReadCnt(int num) {
		System.out.println("dao : plusReadCnt");
		// String sql = "update mvc_board_tbl set readCnt=readCnt+1 where num=?";
		// 1) sqlSession.update
		//sqlSession.update("spring.mvc.pj_117_kys.dao.BoardDAO.plusReadCnt", num);
		
		// 2) sqlSession.getMapper
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.plusReadCnt(num);
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int num) {
		System.out.println("dao : getBoardDetatil");
		// String sql = "SELECT * FROM mvc_board_tbl where num=?";
		// 1) sqlSession.selectOne
		BoardDTO dto = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.BoardDAO.getBoardDetatil", num);
		
		// 2) sqlSession.getMapper
		//BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		//BoardDTO dto = dao.getBoardDetail(num);
		
		return dto;
	}

	// 게시글 비밀번호 인증(게시글 수정, 삭제 시)
	@Override
	public String password_chk(Map<String, Object> map) {
		System.out.println("dao : password_chk");
		// String sql = "SELECT * FROM mvc_board_tbl where num=? and password=?";
		
		// 1) sqlSession.selectList
		String result = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.BoardDAO.password_chk", map);		
				
		// 2) sqlSession.getMapper
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// String result = dao.password_chk(map);
		
		return result;
	}

	// 게시글 수정 처리
	@Override
	public void boardUpdate(BoardDTO dto) {
		System.out.println("dao : boardUpdate");				
		// String sql = "update mvc_board_tbl set title=?, content=?, password=? where num=?";
		// 1) sqlSession.update
		sqlSession.update("spring.mvc.pj_117_kys.dao.BoardDAO.boardUpdate", dto);
		
		// 2) sqlSession.getMapper
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// dao.boardUpdate(dto);
		
	}
	
	// 게시글 삭제 처리
	@Override
	public void boardDelete(int num) {
		System.out.println("dao : boardDelete");		
		
		// 게시글만 삭제할 때
		// String sql = "delete from mvc_board_tbl where num=?";
		// 게시글 삭제 시 게시글  표기 'N' > 숨기기
		// String sql = "update mvc_board_tbl set show='n' where num=?";
		
		// 1) sqlSession.delete
		sqlSession.delete("spring.mvc.pj_117_kys.dao.BoardDAO.boardDelete", num);
			
		// 2) sqlSession.getMapper
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// dao.boardDelete(num);		
	}
	
	// 댓글 작성 처리
	@Override
	public void commentInsert(BoardCommentDTO dto) {
		
		System.out.println("dao - commentInsert");		
		// String sql =" INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_Date) " +		
		//			" VALUES ((SELECT NVL(Max(comment_num)+1,1) FROM mvc_board_comment_tbl), ?, ?, ?, sysdate) ";
		
		// 1) sqlSession.insert
		sqlSession.insert("spring.mvc.pj_117_kys.dao.BoardDAO.commentInsert", dto);
		
		// 2) sqlSession.getMapper
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// dao.commentInsert(dto);
	}

	// 댓글 목록 처리
	@Override
	public List<BoardCommentDTO> commentList(int board_num) {
		System.out.println("dao - commentList");		
		// String sql = "SELECT * FROM mvc_board_comment_tbl WHERE BOARD_NUM = ? ORDER BY COMMENT_NUM";
		
		// 1) sqlSession.selectList
		List<BoardCommentDTO> list = sqlSession.selectList("spring.mvc.pj_117_kys.dao.BoardDAO.commentList", board_num);
		
		// 2) sqlSession.getMapper
		// BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		// List<BoardCommentDTO> list = dao.commentList(board_num);
		
		return list;
	}
}
