package spring.mvc.pj_117_kys.service;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.pj_117_kys.dao.CartDAO;
import spring.mvc.pj_117_kys.dto.CartDTO;


@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO dao;
	
	//장바구니 목록
	@Override
	public void cartListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : cartListAction");

		// 화면으로부터 입력받은 값을 dto에 담는다.
		String strId = (String) req.getSession().getAttribute("customerID");

		// 상품 목록 조회
		List<CartDTO> list = null;
		
		// 장바구니 수량이 있으면
		int total = dao.CartCnt(strId);
		if (total > 0) {
			list = dao.CartList(strId);
		}
		// jsp로 처리결과 전달
		model.addAttribute("list", list);		
	}
	
	// 장바구니 추가
	@Override
	public void cartAddAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service : cartAddAction");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다. (showDetail.jsp)
		String strId = (String) req.getSession().getAttribute("customerID");
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String pdName = req.getParameter("pdName");
		String pdImg = req.getParameter("pdImg");
		int price = Integer.parseInt(req.getParameter("price"));
		int cartCnt = Integer.parseInt(req.getParameter("orderCnt"));
		System.out.println(strId + ", " + pdNo + ", " + pdName + ", " + pdImg + ", " + price + ", " + cartCnt);

		CartDTO dto = new CartDTO();
		dto.setId(strId);
		dto.setPdNo(pdNo);
		dto.setCartCnt(cartCnt);
		dto.setPdName(pdName);
		dto.setPdImg(pdImg);
		dto.setPrice(price);
		dto.setCartCnt(cartCnt);
		dto.setCartTotal(price * cartCnt);

		// 5-1 단계. 장바구니 중복상품 검사
		Map<String, Object> map = new HashMap<String, Object>();
		// map.put("key", value);
		map.put("id", strId);
		map.put("pdNo", pdNo);
		int selectCnt = dao.cartExists(map);

		// 5-2단계. 장바구니 등록
		if (selectCnt != 1) { // 장바구니에 해당상품이 없다
			dao.CartAdd(dto);
		}

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// 장바구니 변경
	@Override
	public void cartUpdateAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {

		System.out.println("service : cartUpdateAction");

		// 3단계. 화면으로부터 입력받은 값을 dto에 담는다.
		String cartNo = req.getParameter("cartNo");
		int cartCnt = Integer.parseInt(req.getParameter("cartCnt"));
		int price = Integer.parseInt(req.getParameter("price"));
		int updateCnt = 0;

		// 실제 값 받아오기
		CartDTO dto = new CartDTO();


		// 체크박스 value="cartNo"로 null이 아닌 경우 dao에서 update 처리
		if (cartNo != null) {		

			dto.setCartNo(Integer.parseInt(cartNo));
			dto.setCartCnt(cartCnt);
			dto.setCartTotal(price * cartCnt);
			updateCnt = dao.CartUpdate(dto);
			System.out.println("장바구니 수정 성공");
		} else {
			System.out.println("장바구니 수정 실패");
		}

		// jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);

	}
	
	//장바구니 삭제
	@Override
	public void cartDeleteAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : cartDeleteAction");
		
		Enumeration<String> e = req.getParameterNames();
		int deleteCnt = 0;

		
		// 체크박스가 체크된 경우 삭제
		while (e.hasMoreElements()) {
			String name = (String) e.nextElement();
			if (name.equals("checked")) {
				String[] values = req.getParameterValues(name);				
				for (String value : values) {
					deleteCnt = dao.cartDelete(Integer.parseInt(value));
				}   				
			}
		}
		// jsp로 처리결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 장바구니 전체 삭제
	@Override
	public void cartDeleteAll(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : cartDeleteAll");
		// 화면으로부터 입력받은 값
		String strId = (String)req.getSession().getAttribute("customerID");

		// 장바구니 전체 삭제
		int deleteCnt = dao.cartDeleteAll(strId);
		
		// jsp로 처리결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
}

