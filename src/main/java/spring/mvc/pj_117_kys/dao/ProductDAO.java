package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.pj_117_kys.dto.CustomerDTO;
import spring.mvc.pj_117_kys.dto.ProductDTO;

public interface ProductDAO {
	// 상품 추가 
	public int productInsert(ProductDTO dto);
	
	// 상품 개수
	public int productCnt();
	
	// 상품 목록
	public List<ProductDTO> productList(Map<String, Object> map);
	
	// 상품 상세페이지
	public ProductDTO productDetail(int pdNo);
	
	// 상품 수정 처리
	public int productUpdate(ProductDTO dto);
	
	// 상품 삭제 처리
	public int productDelete(int pdNo);
	
	// 상품 카테고리
	public List<ProductDTO> productCategory(String category);
	
	// 회원 목록
	public List<CustomerDTO> memberList(Map<String, Object> map);
		
	// 회원 카운트
	public int memberCnt();
}
