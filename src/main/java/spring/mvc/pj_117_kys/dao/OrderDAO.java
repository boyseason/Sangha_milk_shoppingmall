package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_kys.dto.BuyDTO;
import spring.mvc.pj_117_kys.dto.OrderDTO;
import spring.mvc.pj_117_kys.dto.SoldDTO;



public interface OrderDAO {
	// ---- order -----
	// 바로 구매 
	public int orderAdd(OrderDTO dto);
	
	// 장바구니 선택 주문
	public int cartOrder(Map<String, Object> map);
	
	// 주문 개수 확인
	public int orderCnt(String id);
	
	// 주문 목록
	public List<OrderDTO> orderList(String id);	
		
	// 주문 목록 전체 삭제
	public int  orderDelete(String id);				
	
	// ----- buy -----
	// 구매 추가 
	public int buyAdd(Map<String, Object> map);
		
	// 구매 개수 확인
	public int buyCnt(String id);
		
	// 구매 목록
	public List<BuyDTO> buyList(String id);	
			
	// 구매 삭제
	public int buyDelete(int buyNo);		
	
	// 구매 승인
	public int buyConfirm(int buyNo);
	
	// 관리자 구매 목록
	public List<BuyDTO> adminOrderList();	
	
	// ----- refund -----
	// 환불 요청
	public int buyRefund(int buyNo);	
	
	// 환불 승인
	public int confirmRefund(int buyNo);	
	
	// ----- sold -----
	// 결산
	public List<SoldDTO> soldView();
}
