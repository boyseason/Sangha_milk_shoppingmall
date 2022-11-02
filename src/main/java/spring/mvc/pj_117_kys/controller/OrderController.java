package spring.mvc.pj_117_kys.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pj_117_kys.service.CartServiceImpl;
import spring.mvc.pj_117_kys.service.OrderServiceImpl;



@Controller
public class OrderController{
	
	@Autowired
	OrderServiceImpl service;
	
	@Autowired
	CartServiceImpl service_c;

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);		    	
	
	// 주문 목록
    @RequestMapping("orderList.or")
    public String orderList(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > orderList.or]");
			
		service.orderList(req, model);
		return "customer/mypage/order/orderList";			
	} 
    
    // 바로 구매 > 주문 목록
    @RequestMapping("orderAdd.or")
    public String orderAdd(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > orderAdd.or]");
			
		service.orderAdd(req, model);
		return "customer/mypage/order/orderAddAction";			
	}
	
    // 장바구니 선택 구매 > 주문 목록
    @RequestMapping("cartOrder.or")
    public String cartOrder(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > cartOrder.or]");
			
		service.cartOrder(req, model);
		service_c.cartDeleteAll(req, model);
		service.orderList(req, model);
		return "customer/mypage/order/orderList";			
	}
	
    
	// 중복상품 수량 변경 처리
    @RequestMapping("orderTotal.or")
    public String orderTotal(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > orderTotal.or]");
			
		service.orderTotal(req, model);		
		return "customer/mypage/order/orderList";			
	}
	
	// 주문목록 삭제 [주문페이지를 벗어날 때] > 상품목록 이동
    @RequestMapping("orderDelete.or")
    public String orderDelete(HttpServletRequest req, HttpServletResponse res, Model model)
    		throws ServletException, IOException{
		logger.info("[url > orderDelete.or]");
			
		service.orderDelete(req, model);
		String viewPage = req.getContextPath() + "/showAll.do";
		res.sendRedirect(viewPage);	
		return null;			
	}
	
	// 주문 완료 > 구매목록 추가
    @RequestMapping("buyAdd.or")
    public String buyAdd(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > buyAdd.or]");
			
		service.buyAdd(req, model); // 구매 목록 추가
		service.orderDelete(req, model); // 주문 목록 전체삭제
		return "customer/mypage/buy/buyAddAction";			
	}
	
	// 구매 목록
    @RequestMapping("buyList.or")
    public String buyList(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > buyList.or]");
			
		service.buyList(req, model);		
		return "customer/mypage/buy/buyList";			
	}
			
	// 관리자 주문 관리
    @RequestMapping("adminOrder.or")
    public String adminOrder(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > adminOrder.or]");
			
		service.adminOrderList(req, model);		
		return "admin/order/adminOrderList";			
	}	

	// 환불 완료  > 구매 삭제 (고객)
    @RequestMapping("buyDelete.or")
    public String buyDelete(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > buyDelete.or]");
			
		service.buyDelete(req, model);		
		return "customer/mypage/buy/buyDeleteAction";			
	}
	
	// 구매 승인 > 구매 완료(관리자)
    @RequestMapping("buyConfirm.or")
    public String buyConfirm(HttpServletRequest req, HttpServletResponse res, Model model)
    		throws ServletException, IOException{
		logger.info("[url > buyConfirm.or]");
			
		service.buyConfirm(req, model);
		String viewPage = req.getContextPath() + "/adminOrder.or";
		res.sendRedirect(viewPage);
		return null;			
	}
    
	// 환불 요청 > 환불 승인 (관리자)
    @RequestMapping("confirmRefund.or")
    public String confirmRefund(HttpServletRequest req, HttpServletResponse res, Model model)
    		throws ServletException, IOException{
		logger.info("[url > confirmRefund.or]");
			
		service.confirmRefund(req, model);
		String viewPage = req.getContextPath() + "/adminOrder.or";
		res.sendRedirect(viewPage);
		return null;			
	}
	
	// 구매 완료 > 환불 요청 (고객)
    @RequestMapping("buyRefund.or")
    public String buyRefund(HttpServletRequest req, HttpServletResponse res, Model model)
    		throws ServletException, IOException{
		logger.info("[url > buyRefund.or]");
			
		service.buyRefund(req, model);
		String viewPage = req.getContextPath() + "/buyList.or";
		res.sendRedirect(viewPage);
		return null;			
	}
	
	// 결산 (관리자)
    @RequestMapping("soldView.or")
    public String soldView(HttpServletRequest req, Model model)
    		throws ServletException, IOException{
		logger.info("[url > soldView.or]");
			
		service.soldView(req, model);		
		return "admin/sold/sold";			
	}
}


