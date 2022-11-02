package spring.mvc.pj_117_kys.dto;

import java.sql.Date;

// DTO(Data Transfer Object) : setter > 멤버변수 > getter 
/**
 * @author kosmo
 *
 */
public class ProductDTO {
	
	/*
	CREATE TABLE mvc_product_tbl(
	pdNo 		NUMBER 			PRIMARY KEY, -- 상품번호
	pdName 		varchar2(40) 	NOT NULL UNIQUE, -- 상품명
	pdImg 		varchar2(100) 	NOT NULL, -- 이미지가 아니라 경로가 들어간다
	category 	varchar2(50) 	NOT NULL, -- 카테고리
	brand 		varchar2(50) 	NOT NULL, -- 브랜드
	cotent 		clob,					 -- 상품설명
	price 		NUMBER 			NOT NULL, -- 가격
	quantity 	NUMBER 			NOT NULL, -- 수량
	status 		varchar2(20)	NOT NULL, -- 상태
	indate		DATE 	DEFAULT sysdate   -- 입고일
	);
	 */

	private int pdNo; 	// 상품번호
	private String pdName; // 상품명
	private String pdImg; // 이미지
	private String category; // 카테고리
	private String brand; // 브랜드
	private String content; // 상품설명
	private int price; // 조회수
	private int quantity; // 수량
	private String status; // 상태
	private Date indate; // 입고일
	
	// 디폴트
	public ProductDTO() {}
	
	// setter / getter
	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public String getPdImg() {
		return pdImg;
	}

	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "ProductDTO [pdNo=" + pdNo + ", pdName=" + pdName + ", pdImg=" + pdImg + ", category=" + category
				+ ", brand=" + brand + ", content=" + content + ", price=" + price + ", quantity=" + quantity
				+ ", status=" + status + ", indate=" + indate + "]";
	};
	
}
