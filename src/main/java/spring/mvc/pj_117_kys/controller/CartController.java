package spring.mvc.pj_117_kys.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_kys.dao.CartDAO;
import spring.mvc.pj_117_kys.service.CartServiceImpl;

@Controller
public class CartController{
	   
	@Autowired
	CartServiceImpl service;
	
	@Autowired
	CartDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	// 장바구니 목록
	@RequestMapping("cartList.cu") 
	public String cartList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
	  	logger.info("[url > cartList.cu]");
						
		service.cartListAction(req, model);
		return "customer/mypage/cart/cartList";
	}
	
	// 장바구니 추가
	@RequestMapping("cartAddAction.cu") 
	public String cartAddAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url > cartAddAction.cu]");
							
		service.cartAddAction(req, model);
		return "customer/mypage/cart/cartAddAction";
	}
		
	// 장바구니 수정
	@RequestMapping("cartUpdateAction.cu") 
	public String cartUpdateAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url > cartUpdateAction.cu]");
							
		service.cartUpdateAction(req, model);
		String viewPage = req.getContextPath() + "/cartList.cu";
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 장바구니 삭제
	@RequestMapping("cartDeleteAction.cu") 
	public String cartDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		  logger.info("[url > cartDeleteAction.cu]");
							
		service.cartDeleteAction(req, model);
		return "customer/mypage/cart/cartDeleteAction";
	}

	// 장바구니 전체 삭제
	@RequestMapping("cartDeleteAll.cu") 
	public String cartDeleteAll(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		  logger.info("[url > cartDeleteAll.cu]");
							
		service.cartDeleteAll(req, model);
		return "customer/product/showAll";
	}
}

