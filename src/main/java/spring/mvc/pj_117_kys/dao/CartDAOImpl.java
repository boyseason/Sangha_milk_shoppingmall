package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_kys.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	@Autowired
    SqlSession sqlSession; 
	
	DataSource dataSource;

	
	//장바구니 목록
	@Override
	public List<CartDTO> CartList(String id) {
		System.out.println("dao : 장바구니목록");

		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		List<CartDTO> list = dao.CartList(id);
//		String sql = "SELECT * FROM kys_cart_tbl ca " 
//					+ "join kys_customer_tbl cu on ca.id = cu.id "
//					+ "join kys_product_tbl p on p.pdNo = ca.pdNo " 
//					+ "where cu.id=?";

		return list;
	}
	
	// 장바구니 개수 확인
	@Override
	public int CartCnt(String id) {
		System.out.println("dao : CartCnt");
		
		// String sql = "SELECT COUNT(*) as cnt FROM kys_cart_tbl where id=?";
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int selectCnt = dao.CartCnt(id);
		return selectCnt;
	}
	
	//장바구니 상품 추가 
	@Override
	public int CartAdd(CartDTO dto) {
		System.out.println("dao : 장바구니 추가");

		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int insertCnt = dao.CartAdd(dto);
//		String sql ="INSERT INTO kys_cart_tbl(cartNo, id, pdNo, cartCnt, cartTotal) "
//					+ "VALUES((SELECT NVL(MAX(cartNo) + 1, 1) FROM kys_cart_tbl), ?, ?, ?, ?)";
		
		return insertCnt;
	}
	
	
	//장바구니 수정
	@Override
	public int CartUpdate(CartDTO dto) {
		System.out.println("dao - 장바구니 변경");
		
//		String sql = "UPDATE kys_cart_tbl SET cartCnt=?, cartTotal=? WHERE cartNo=?";
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int updateCnt = dao.CartUpdate(dto);
		
		return updateCnt;
	}


	//장바구니 삭제 
	@Override
	public int cartDelete(int cartNo) {
		System.out.println("dao : 장바구니 삭제");		           
//	    String sql ="DELETE FROM kys_cart_tbl WHERE cartNo=?";
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int deleteCnt = dao.cartDelete(cartNo);
		
		return deleteCnt;
	}
	
	// 장바구니 전체 삭제
	@Override
	public int cartDeleteAll(String id) {
		System.out.println("dao : 장바구니  전체 삭제");		         
//		String sql ="DELETE FROM kys_cart_tbl WHERE id=?";
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int deleteCnt = dao.cartDeleteAll(id);
	   
		return deleteCnt;
	}
	
	
	// 장바구니 중복 확인
	@Override
	public Integer cartExists(Map<String, Object> map) {
		// String id, int pdNo
		System.out.println("dao : 장바구니 중복 체크");
//		String sql = "SELECT count(*) FROM kys_cart_tbl  WHERE pdNo=? and id=?";
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		int selectCnt = dao.cartExists(map);
		
		return selectCnt;
	}

}
