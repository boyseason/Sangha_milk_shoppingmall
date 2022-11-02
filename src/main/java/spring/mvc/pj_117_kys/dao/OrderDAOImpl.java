package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_kys.dto.BuyDTO;
import spring.mvc.pj_117_kys.dto.OrderDTO;
import spring.mvc.pj_117_kys.dto.SoldDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
    SqlSession sqlSession; 
	
	DataSource dataSource;
	
	
	
	// 바로 구매 시 주문(dto)
	@Override
	public int orderAdd(OrderDTO dto) {
		System.out.println("dao : orderAdd");
		
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int insertCnt = dao.orderAdd(dto);	
//		String sql = "INSERT INTO kys_order_tbl(orderNo, id, pdNo, orderCnt, orderTotal, orderDate) "
//					+ "VALUES((SELECT NVL(MAX(orderNo) + 1, 1) FROM kys_order_tbl), ?, ?, ?, ?, sysdate)";
	
		return insertCnt;
	}

	// 장바구니 선택 주문
	@Override
	public int cartOrder(Map<String, Object> map) {
		System.out.println("dao : cartOrder");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int insertCnt = dao.cartOrder(map);		
//		String sql = "INSERT INTO kys_order_tbl(orderNo, id, pdNo, orderCnt, orderTotal) " 
//						+ "values( " 
//						+ "(SELECT NVL(Max(orderNo)+1,1) FROM kys_order_tbl), "  
//						+ "?, " 
//						+ "(SELECT pdNo FROM kys_cart_tbl where cartno=?), " 
//						+ "(SELECT cartCnt FROM kys_cart_tbl where cartno=?), " 
//						+ "(SELECT cartTotal FROM kys_cart_tbl where cartno=?))";
		
		return insertCnt; 
	}
	
	// 주문 개수 확인
	@Override
	public int orderCnt(String id) {
		System.out.println("dao : orderCnt");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int selectCnt = dao.orderCnt(id);		
//		String sql = "SELECT COUNT(*) as cnt FROM kys_order_tbl where id=?";
		
		return selectCnt;
	}

	
	// 주문 목록
	@Override
	public List<OrderDTO> orderList(String id) {
		System.out.println("dao : orderList");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		List<OrderDTO> list = dao.orderList(id);		
//		String sql = "SELECT * FROM kys_order_tbl o " 
//					+ "join kys_customer_tbl cu on o.id = cu.id "
//					+ "join kys_product_tbl p on p.pdNo = o.pdNo " 
//					+ "where cu.id=? ORDER BY orderNo desc";

		return list;
	}
	
	// 주문 목록 전체 삭제
	@Override
	public int orderDelete(String id) {
		System.out.println("dao : orderDelete");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int deleteCnt = dao.orderDelete(id);
//		String sql = "DELETE FROM kys_order_tbl WHERE id=?";
		
		return deleteCnt;
	}

	// 구매 목록 추가
	@Override
	public int buyAdd(Map<String, Object> map) {
		System.out.println("dao : buyAdd");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int insertCnt = dao.buyAdd(map);		
//		String sql = "INSERT INTO kys_buy_tbl(buyNo, id, pdNo, buyCnt, buyTotal) " 
//						+ "values( " 
//						+ "(SELECT NVL(Max(buyNo)+1,1) FROM kys_buy_tbl), "  
//						+ "?, " 
//						+ "(SELECT pdNo FROM kys_order_tbl where orderNo=?), " 
//						+ "(SELECT orderCnt FROM kys_order_tbl where orderNo=?), " 
//						+ "(SELECT orderTotal FROM kys_order_tbl where orderNo=?))";
		
		return insertCnt; 
	}
	
	// 구매 목록 개수
	@Override
	public int buyCnt(String id) {
		System.out.println("dao : buyCnt");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int selectCnt = dao.buyCnt(id);	
//		String sql = "SELECT COUNT(*) as cnt FROM kys_buy_tbl where id=?";
		
		return selectCnt;
	}
	
	// 구매 목록
	@Override
	public List<BuyDTO> buyList(String id) {
		System.out.println("dao : buyList");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		List<BuyDTO> list = dao.buyList(id);		
//		String sql = "SELECT * FROM kys_buy_tbl b " 
//					+ "join kys_customer_tbl cu on b.id = cu.id "
//					+ "join kys_product_tbl p on p.pdNo = b.pdNo " 
//					+ "where cu.id=? ORDER BY buyNo desc";

		return list;
	}
	
	// 관리자 주문관리
	@Override
	public List<BuyDTO> adminOrderList() {
		System.out.println("dao : adminOrderList");	
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		List<BuyDTO> list = dao.adminOrderList();		
//		String sql = "SELECT * FROM kys_buy_tbl b " 
//					+ "join kys_customer_tbl cu on b.id = cu.id "
//					+ "join kys_product_tbl p on p.pdNo = b.pdNo " 
//					+ "ORDER BY buyNo desc";

		return list;
	}		
	
	// 구매 삭제
	@Override
	public int buyDelete(int buyNo) {
		System.out.println("dao : buyDelete");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int deleteCnt = dao.buyDelete(buyNo);	
//		String sql = "DELETE FROM kys_buy_tbl WHERE buyNo=?";
		
		return deleteCnt;
	}

	// 구매 승인 > 구매 완료 (관리자)
	@Override
	public int buyConfirm(int buyNo) {
		System.out.println("dao : buyConfirm");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int updateCnt = dao.buyConfirm(buyNo);
//		String sql = "update kys_buy_tbl set buyState='구매완료'"
//					+ "WHERE buyNo=?";
		
		return updateCnt;
	}

	// 구매완료 > 환불 요청 (고객)
	@Override
	public int buyRefund(int buyNo) {
		System.out.println("dao : buyRefund");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int updateCnt = dao.buyRefund(buyNo);
//		String sql = "update kys_buy_tbl "
//					+ "set buyState='환불요청'"
//					+ "WHERE buyNo=?";
		
		return updateCnt;
	}

	// 환불 요청 > 환불 승인 (관리자)
	@Override
	public int confirmRefund(int buyNo) {
		System.out.println("dao : confirmRefund");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		int updateCnt = dao.confirmRefund(buyNo);				
//		String sql = "update kys_buy_tbl "
//					+ "set buyState='환불승인'"
//					+ "WHERE buyNo=?";
		
		return updateCnt;
	}

	// 결산 (관리자)
	@Override
	public List<SoldDTO> soldView() {
		System.out.println("dao : soldView");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		List<SoldDTO> list = dao.soldView();		
		
//		String sql = "SELECT TO_DATE(b.BUYDATE, 'YY-MM-DD') AS soldDate" + 
//					" , count(b.buyNo) AS soldCnt" + 
//					" , sum(b.BUYTOTAL) AS soldTotal" + 
//					" FROM kys_buy_tbl b" + 
//					" WHERE b.BUYSTATE = '구매완료' OR b.BUYSTATE = '환불요청'" + 
//					" GROUP BY TO_DATE(b.BUYDATE, 'YY-MM-DD')";
		
		return list;
	}

}
