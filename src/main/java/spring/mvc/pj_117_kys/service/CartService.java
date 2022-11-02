package spring.mvc.pj_117_kys.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CartService {
	
	
	// 장바구니 목록
	public void cartListAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 장바구니 추가
	public void cartAddAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 장바구니 수정
	public void cartUpdateAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 장바구니 삭제
	public void cartDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException;

	// 장바구니 전체 삭제
	public void cartDeleteAll(HttpServletRequest req, Model model) throws ServletException, IOException;
}
