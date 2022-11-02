package spring.mvc.pj_117_kys.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.pj_117_kys.dto.CustomerDTO;
import spring.mvc.pj_117_kys.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
    SqlSession sqlSession; // dataSource-config.xml 커넥션풀  + 마이바티스 	(pom.xml) 필요
	
	DataSource dataSource; 	

	@Override
	public int productInsert(ProductDTO dto) {
		System.out.println("dao : productInsert");
		// String sql = "INSERT INTO mvc_product_tbl(pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate) " + 
		//			"values((SELECT NVL(Max(pdNo)+1,1) FROM mvc_product_tbl), ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		// 1) sqlSession.insert
		int insertCnt = sqlSession.insert("spring.mvc.pj_117_kys.dao.ProductDAO.productInsert", dto);
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// int insertCnt = dao.productInsert(dto);
		
		return insertCnt;
	}

	@Override
	public int productCnt() {
		System.out.println("dao : productCnt");		
		// String sql = "SELECT count(*) as cnt FROM mvc_product_tbl";
		
		// 1) sqlSession.selectOne
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.ProductDAO.productCnt");
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// int selectCnt = dao.productCnt();	
		
		return selectCnt;
	}

	@Override
	public List<ProductDTO> productList(Map<String, Object> map) {
		System.out.println("dao : productList");

//		String sql = "SELECT * FROM " + "(SELECT A.*, rownum AS rn FROM"
//				+ " (SELECT pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate FROM mvc_product_tbl"
//				+ " ORDER BY pdNo) A)" + " WHERE rn BETWEEN ? AND ?";
		
		// 1) sqlSession.selectList
		List<ProductDTO> list = sqlSession.selectList("spring.mvc.pj_117_kys.dao.ProductDAO.productList", map);
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// List<ProductDTO> list = dao.productList(map);
		
		return list;
	}

	@Override
	public ProductDTO productDetail(int pdNo) {
		System.out.println("dao : productDetail");		
		// String sql = "SELECT * FROM mvc_product_tbl where pdNo=?";
		
		// 1) sqlSession.selectOne
		ProductDTO dto = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.ProductDAO.productDetail", pdNo);
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// ProductDTO dto = dao.productDetail(pdNo);
		
		return dto;
	}

	@Override
	public int productUpdate(ProductDTO dto) {
		System.out.println("dao : productUpdate");		
//		String sql = "update mvc_product_tbl " +
//					"set pdName=?, pdImg=?, category=?, brand=?, content=?, price=?, quantity=?, status=? "
//					+ "where pdNo=?";			
		// 1) sqlSession.update
		int updateCnt = sqlSession.update("spring.mvc.pj_117_kys.dao.ProductDAO.productUpdate", dto);
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// int updateCnt = dao.productUpdate(dto);
		
		return updateCnt;
	}

	@Override
	public int productDelete(int pdNo) {
		System.out.println("dao : productDelete");			
		// String sql = "delete from mvc_product_tbl where pdNo=?";
		
		// 1) sqlSession.delete
		int DeleteCnt = sqlSession.delete("spring.mvc.pj_117_kys.dao.ProductDAO.productDelete", pdNo);
		
		// 2) sqlSession.getMapper
		// ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		// int DeleteCnt = dao.productDelete(pdNo);
		
		return DeleteCnt;
	}
	
	// 상품 카테고리
	@Override
	public List<ProductDTO> productCategory(String category) {
		System.out.println("dao : productCategory");		
//		String sql = "SELECT * FROM kys_product_tbl where category=?";
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		List<ProductDTO> list = dao.productCategory(category);
		
		return list;
	}
	
	// 회원 목록
	@Override
	public List<CustomerDTO> memberList(Map<String, Object> map) {
		System.out.println("dao : memberList");		
//		String sql = "SELECT * FROM " + 
//				"(SELECT A.*, rownum AS rn FROM" + 
//				" (SELECT id, password, name, birthday, address, phone, email, regdate FROM kys_customer_tbl" 
//				+ " ORDER BY id) A)" 
//				+ " WHERE rn BETWEEN ? AND ?";
		List<CustomerDTO> list = sqlSession.selectList("spring.mvc.pj_117_kys.dao.CustomerDAO.memberList", map);
		
		return list;
	}

	// 회원 카운트
	@Override
	public int memberCnt() {
		System.out.println("dao : memberCnt");
// 		String sql = "SELECT count(*) as cnt FROM kys_customer_tbl";
		int selectCnt = sqlSession.selectOne("spring.mvc.pj_117_kys.dao.CustomerDAO.memberCnt");
		
		return selectCnt;
	}

}
