package spring.mvc.pj_117_kys.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.pj_117_kys.service.ProductServiceImpl;

@Controller
public class StockController {
	
	@Autowired
	ProductServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);		    	
	
	// 상품 목록
    @RequestMapping("productList.st")
    public String productList(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > productList.st]");
			
		service.productList(req, model);
		return "admin/product/productList";			
	} 
    
    // 상품추가
    @RequestMapping("productAdd.st")
    public String productAdd(){
    	logger.info("[url > productAdd.st]");
						
		return "admin/product/productAdd";			
	} 
    
    // 상품 등록 처리 MultipartHttpServletRequest req
    @RequestMapping("productAddAction.st")
    public String productAddAction(MultipartHttpServletRequest req, Model model)
    		throws ServletException, IOException{
    	logger.info("[url > productAddAction.st]");
			
		service.productAddAction(req, model);		
		return "admin/product/productAddAction";			
	} 
    
    // 상품 상세페이지
    @RequestMapping("productDetailAction.st")
    public String productDetailAction(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
    	logger.info("[url > productDetailAction.st]");
						
		service.productDetailAction(req, model);
		return "admin/product/productDetail";
			
	} 
    
    // 상품 수정 MultipartHttpServletRequest req
    @RequestMapping("productUpdateAction.st")
    public String productUpdateAction(MultipartHttpServletRequest req, Model model)
    		throws ServletException, IOException{
    	logger.info("[url > productUpdateAction.st]");
			
		service.productUpdateAction(req, model);
		return "admin/product/productUpdateAction";			
	} 
    
    // 상품 삭제
    @RequestMapping("productDeleteAction.st")
    public String productDeleteAction(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > productDeleteAction.st]");
						
		service.productDeleteAction(req, model);
		return "admin/product/productDeleteAction";			
	}     
	
    // 상품 카테고리
    @RequestMapping("productCategory.st")
    public String productCategory(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > productCategory.st]");
						
		service.productCategory(req, model);
		return "admin/product/productCategory";			
	}
    
    // 회원 목록
    @RequestMapping("memberList.st")
    public String memberList(HttpServletRequest req, Model model) 
    		throws ServletException, IOException{
    	logger.info("[url > memberList.st]");
						
		service.memberList(req, model);
		return "admin/member/memberList";			
	}
    
}
