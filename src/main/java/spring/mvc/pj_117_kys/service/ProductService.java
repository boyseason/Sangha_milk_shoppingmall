package spring.mvc.pj_117_kys.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {

	// 상품 목록
	public void productList(HttpServletRequest req, Model model) 
		throws ServletException, IOException;
	
	// 상품 등록
	public void productAddAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품 상세페이지
	public void productDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품 수정
	public void productUpdateAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품 삭제
	public void productDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 상품 카테고리
	public void productCategory(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	// 회원 목록
	public void memberList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
}
