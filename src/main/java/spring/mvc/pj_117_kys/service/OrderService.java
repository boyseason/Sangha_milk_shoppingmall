package spring.mvc.pj_117_kys.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface OrderService {
	
	// 주문 등록
	public void orderAdd(HttpServletRequest req, Model model)
			throws ServletException, IOException;
		
	// 주문 목록
	public void orderList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 수량 처리
	public void orderTotal(HttpServletRequest req, Model model) 
		throws ServletException, IOException;

	// 주문 삭제
	public void orderDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 장바구니 선택 주문
	public void cartOrder(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

	// 구매 등록
	public void buyAdd(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

	// 구매 목록
	public void buyList(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

	// 구매 삭제
	public void buyDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

	// 구매 승인
	public void buyConfirm(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 환불 요청
	public void buyRefund(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 환불 승인
	public void confirmRefund(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 결산
	public void soldView(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 관리자 주문관리
	public void adminOrderList(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
}
