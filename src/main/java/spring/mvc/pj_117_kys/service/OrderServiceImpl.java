package spring.mvc.pj_117_kys.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_117_kys.dao.OrderDAO;
import spring.mvc.pj_117_kys.dao.ProductDAO;
import spring.mvc.pj_117_kys.dto.BuyDTO;
import spring.mvc.pj_117_kys.dto.OrderDTO;
import spring.mvc.pj_117_kys.dto.ProductDTO;
import spring.mvc.pj_117_kys.dto.SoldDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDAO dao;
	
	@Autowired
	ProductDAO _dao;
	
	
	// 구매 등록
	@Override
	public void buyAdd(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : buyAdd");

		// 화면으로부터 입력받은 값을 받는다
		String strId = (String)req.getSession().getAttribute("customerID");
		String[] orderArr = req.getParameterValues("orderNo");

		int insertCnt = 0;

		if(orderArr != null) {
			// 주문 종류만큼 주문번호를 받아 Add 수행
			for (int i = 0; i < orderArr.length; i++) {
				int orderNo = Integer.parseInt(orderArr[i]);
				
				Map<String, Object> map = new HashMap<String, Object>();	
				map.put("id", strId);
				map.put("orderNo", orderNo);
				System.out.println("orderNo : " + orderNo);
				
				insertCnt = dao.buyAdd(map);
			}
		}
		// jsp 처리 결과 전달
		model.addAttribute("insertCnt", insertCnt);		
	}
	
	// 구매 목록
	@Override
	public void buyList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : buyList");

		// 화면으로부터 입력받은 값을 받는다
		String strId = (String) req.getSession().getAttribute("customerID");				
		
		// 구매 목록 조회
		List<BuyDTO> list = null;
		// 주문 수량이 있으면
		int total = dao.buyCnt(strId);
		
		if (total > 0) {
			list = dao.buyList(strId);
		}
		// jsp로 처리결과 전달
		model.addAttribute("list", list);		
	}

	// 구매 삭제
	@Override
	public void buyDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : buyDelete");
		
		// 화면으로부터 입력받은 값을 받는다.
		int buyNo = Integer.parseInt(req.getParameter("buyNo"));
		
		int deleteCnt = dao.buyDelete(buyNo); 
		
		// jsp 처리 결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	@Override
	// 장바구니 > 주문 목록 이동
	public void cartOrder(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : cartOrder");

		// 화면으로부터 입력받은 값을 받는다. (id, cartNo)
		String strId = (String) req.getSession().getAttribute("customerID");
		String[] checkArr = req.getParameterValues("checked");

		int insertCnt = 0;

		// 체크박스의 수(배열 길이)만큼 주문 추가
		for (int i = 0; i < checkArr.length; i++) {
			int cartNo = Integer.parseInt(checkArr[i]);
			System.out.println("cartNo : " + cartNo);
			Map<String, Object> map = new HashMap<String, Object>();	
			map.put("id", strId);
			map.put("cartNo", cartNo);
			insertCnt = dao.cartOrder(map);
		}
		model.addAttribute("insertCnt", insertCnt);
	} 
	
	// 주문 등록
	@Override
	public void orderAdd(HttpServletRequest req, Model model) 
			throws ServletException, IOException {		
		System.out.println("service : orderAdd");
		
		// 화면으로부터 입력받은 값을 받는다.
		String strId = (String)req.getSession().getAttribute("customerID");	
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int orderCnt = Integer.parseInt(req.getParameter("orderCnt"));
		System.out.println("id: " + strId + ", pdNo : " + pdNo + ", orderCnt : " + orderCnt);		
	
		
		ProductDTO _dto = _dao.productDetail(pdNo);
		int price = _dto.getPrice();
		int total = price * orderCnt;
		
		OrderDTO dto = new OrderDTO();
		dto.setId(strId);
		dto.setPdNo(pdNo);
		dto.setPrice(price);
		dto.setOrderCnt(orderCnt);
		dto.setOrderTotal(total);
		System.out.println("total : " + total);
		
		int insertCnt = dao.orderAdd(dto);

		// jsp 처리 결과
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 주문 목록
	@Override
	public void orderList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : orderList");

		// 화면으로부터 입력받은 값을 받는다
		String strId = (String)req.getSession().getAttribute("customerID");

		// 주문 목록 조회
		List<OrderDTO> list = null;
		// 주문 수량이 있으면
		int total = dao.orderCnt(strId);
		if (total > 0) {
			list = dao.orderList(strId);
		}
		// jsp로 처리결과 전달
		model.addAttribute("list", list);
	}

	// 중복상품 수량 처리
	@Override
	public void orderTotal(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : orderTotal");
		
		// 화면으로부터 입력받은 값을 받는다.
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int orderCnt = Integer.parseInt(req.getParameter("orderCnt"));
		System.out.println("pdNo : " + pdNo + ", orderCnt : " + orderCnt);

		ProductDTO dto = _dao.productDetail(pdNo);
		int price = dto.getPrice();
		int total = price * orderCnt;
		System.out.println("total : " + total);

		// jsp 처리 결과
		model.addAttribute("pdNo", pdNo);
		model.addAttribute("total", total);
	}

	// 주문 삭제
	@Override
	public void orderDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : orderDelete");
		
		// 화면으로부터 입력받은 값을 받는다.
		String strId = (String) req.getSession().getAttribute("customerID");
		
		int deleteCnt = dao.orderDelete(strId);

		// jsp 처리 결과
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	// 구매 승인
	@Override
	public void buyConfirm(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : buyConfirm");
		
		// 화면으로부터 입력받은 값을 받는다.
		int buyNo = Integer.parseInt(req.getParameter("buyNo"));
		System.out.println("buyNo : " + buyNo);
		
		int selectCnt = dao.buyConfirm(buyNo);

		// jsp 처리 결과
		model.addAttribute("selectCnt", selectCnt);
		
	}
	
	// 환불 요청
	@Override
	public void buyRefund(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : buyRefund");
		
		// 화면으로부터 입력받은 값을 받는다.
		int buyNo = Integer.parseInt(req.getParameter("buyNo"));
		System.out.println("buyNo : " + buyNo);
		
		int selectCnt = dao.buyRefund(buyNo);

		// jsp 처리 결과
		model.addAttribute("selectCnt", selectCnt);
		
	}

	// 환불 승인 (관리자)
	@Override
	public void confirmRefund(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : confirmRefund");
		
		// 화면으로부터 입력받은 값을 받는다.
		int buyNo = Integer.parseInt(req.getParameter("buyNo"));
		System.out.println("buyNo : " + buyNo);
		
		int selectCnt = dao.confirmRefund(buyNo);

		// jsp 처리 결과
		model.addAttribute("selectCnt", selectCnt);
	}

	// 결산
	@Override
	public void soldView(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : soldView");
		// date 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 	 
		List<SoldDTO> list = dao.soldView();
		int n = list.size();
		List<String> date = new ArrayList<String>();
		for(int i=0; i<n; i++) {
			String soldDate = simpleDateFormat.format(list.get(i).getSoldDate());			
			date.add(soldDate);
		}		
		// jsp 처리 결과
		model.addAttribute("date", date);
		model.addAttribute("list", list);
	}
	
	// 관리자 주문관리
	@Override
	public void adminOrderList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : adminOrderList");

		// 구매 목록 조회
		List<BuyDTO> list = null;
		
		list = dao.adminOrderList();
		
		// jsp로 처리결과 전달
		model.addAttribute("list", list);				
	}

}
