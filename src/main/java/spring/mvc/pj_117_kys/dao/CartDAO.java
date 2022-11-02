package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_kys.dto.CartDTO;


public interface CartDAO {
	
		//장바구니 상품 목록
		public List<CartDTO> CartList(String id);
		
		//상품 갯수
		public int CartCnt(String id);
		
		// 장바구니 상품 추가 처리
		public int CartAdd(CartDTO dto);

		// 장바구니 상품 수정 처리
		public int CartUpdate(CartDTO dto);
		
		// 장바구니 상품 전체 삭제 처리
		public int  cartDelete(int cartNo);
		
		// 장바구니 전체 삭제
		public int cartDeleteAll(String id);
		
		// 장바구니 중복 상품 체크
		public Integer cartExists(Map<String, Object> map);		
}
