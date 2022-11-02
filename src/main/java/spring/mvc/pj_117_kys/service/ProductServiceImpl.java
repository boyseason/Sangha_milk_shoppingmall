package spring.mvc.pj_117_kys.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import page.Paging;
import spring.mvc.pj_117_kys.dao.ProductDAO;
import spring.mvc.pj_117_kys.dto.CustomerDTO;
import spring.mvc.pj_117_kys.dto.ProductDTO;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	// 상품목록
	@Override
	public void productList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service : productList");
		
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 전체 상품 카운트 > paging에 총 갯수 설정 > 처음, 마지막, 페이지 갯수 설정
		int totalCnt = dao.productCnt();
		System.out.println("totalCnt : " + totalCnt);
		paging.setTotalCount(totalCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		System.out.println("start : " + start + ", end : " + end);
		
		// 상품 목록
		List<ProductDTO> list = null;
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("start", start);
		map.put("end", end);
		
		if (totalCnt > 0) {
			list = dao.productList(map);
		}
		
		// jsp로 결과 전달 : model.addAttribute
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 상품 등록 MultipartHttpServletRequest req
	@Override
	public void productAddAction(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException {
		// pdNo pdName pdImg category brand content price quantity status indate
		System.out.println("service : productAddAction");
		
		// 추가S : JSP의 ImageUploadeHandler 파일 기능
		MultipartFile file = req.getFile("pdImg");
		System.out.println("file : " + file);
		
		// input
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		// D:\Dev117\workspace\spring_pj_117\src\main\webapp\resources\images : 선택이미지 경로
		// ouput : spring_pj_117의 upload로 경로 수정
		String realDir = "D:\\Dev117\\workspace\\spring_pj_117\\src\\main\\webapp\\resources\\upload\\";
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			
			// saveDir 경로에서 읽어서 realDir로 출력
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) { // 읽은 데이터 값이 끝이 아니면
				fos.write(data); // 출력
			}
			
			// 추가E
			// 3단계. 화면으로부터 입력받은 값을 받는다.
			ProductDTO dto = new ProductDTO();
			dto.setPdName(req.getParameter("pdName"));
			
			// 프로젝트명/upload 해당경로
			String p_img = "/pj_117/resources/upload/" + file.getOriginalFilename();
		    System.out.println("p_img : " + p_img);
			dto.setPdImg(p_img);
			dto.setCategory(req.getParameter("category"));
			dto.setBrand(req.getParameter("brand"));
			dto.setContent(req.getParameter("content"));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			dto.setStatus(req.getParameter("status"));
			
			// 5단계 insert
			int insertCnt = dao.productInsert(dto);
			System.out.println("insertCnt : " + insertCnt);
			
			// 6단계 jsp 처리 결과 model.addAttribute
			model.addAttribute("insertCnt", insertCnt);		
		} catch(IOException e ){
			e.printStackTrace();
		} finally {
			fis.close();
			fos.close();
		}
	}
	
	// 상품 상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		// pdNo pdName pdImg category brand content price quantity status indate
		System.out.println("service : productDetailAction");
		
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		String pageNum = req.getParameter("pageNum"); // 처리 페이지에서 필요한 페이지 넘버
		System.out.println("pageNum : " + pageNum);
		
		// 5단계 
		ProductDTO dto = dao.productDetail(pdNo);

		// 6단계 jsp 처리 결과
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 상품 수정 MultipartHttpServletRequest req
	@Override
	public void productUpdateAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service : productUpdateAction");
		
		// 3단계. 화면으로부터 입력받은 값을 받는다. (hidden)
		String pageNum = req.getParameter("pageNum");  // 처리 페이지에서 필요한 페이지 넘버
		int pdNo = Integer.parseInt(req.getParameter("hiddenPdNo"));
		String pdImg = req.getParameter("hiddenPdImg"); // 기존 img
		// String uploadPdImg = (String)req.getAttribute("fileName"); // 업로드(수정) img
		
		// 추가S : JSP의 ImageUploadeHandler 파일 기능
		// productDetail.jsp에서 <input type="file" name="pdImg" value="${dto.pdImg}" accept="image/*">
		MultipartFile file = req.getFile("pdImg");
		System.out.println("file : " + file);
				
		// input
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
				
		// D:\Dev117\workspace\spring_pj_117\src\main\webapp\resources\images : 선택이미지 경로
		// ouput : spring_pj_117의 upload로 경로 수정
		String realDir = "D:\\Dev117\\workspace\\spring_pj_117\\src\\main\\webapp\\resources\\upload\\";
		
		// 이미지를 수정하고자 할 때 선택한 이미지를 p_img로 등록
		String p_img = "";
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));
				
				// saveDir 경로에서 읽어서 realDir로 출력
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read()) != -1) { // 읽은 데이터 값이 끝이 아니면
					fos.write(data); // 출력
				}				
				
			} catch(IOException e ){
				e.printStackTrace();
			} finally{
				fis.close();
				fos.close();
				// 수정S
				p_img = "/pj_117_kys/resources/upload/" + file.getOriginalFilename();
		    	System.out.println("새 이미지 : " + p_img);
			}
		} else {
			// 기존이미지 사용
			p_img = pdImg;
		    System.out.println("기존 이미지 : " + p_img);
		}		
		// 수정E
		// pdNo pdName pdImg category brand content price quantity status indate
		ProductDTO dto = new ProductDTO();
		dto.setPdNo(pdNo); // hidden 값
		dto.setPdName(req.getParameter("pdName"));
		dto.setBrand(req.getParameter("brand"));
		dto.setPdImg(p_img); // 기존 or 수정 img		 
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
		dto.setStatus(req.getParameter("status"));
		
		
		// 5단계 
		int updateCnt = dao.productUpdate(dto);
		
		// 6단계 jsp 처리 결과
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 상품 삭제
	@Override
	public void productDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service : productDeleteAction");
		
		// 3단계. 화면으로부터 입력받은 값을 받는다.		
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		
		// 5단계
		int deleteCnt = dao.productDelete(pdNo);

		// 6단계 jsp 처리 결과		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void productCategory(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service : productCategory");
		
		// 3단계. 화면으로부터 입력받은 값을 받는다.
		String category = req.getParameter("category");
		System.out.println("category : " + category);
			
		// 상품 목록
		List<ProductDTO> list = dao.productCategory(category);
		
		// jsp로 결과 전달 : request.setAttribute
		model.addAttribute("list", list);			
	}

	// 회원 목록
	@Override
	public void memberList(HttpServletRequest req, Model model) {
		System.out.println("service : memberList");
		
		// 화면으로부터 입력받은 값을 받는다.
		String pageNum = req.getParameter("pageNum");				
		Paging paging = new Paging(pageNum);
				
		int totalCnt = dao.memberCnt();
		System.out.println("totalCnt : " + totalCnt);
		paging.setTotalCount(totalCnt);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		System.out.println("start : " + start + ", end : " + end);
		
		// 회원 목록		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<CustomerDTO> list = null;
		if (totalCnt > 0) {
			list = dao.memberList(map);
		}
		
		// jsp로 결과 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);		
	}

}
