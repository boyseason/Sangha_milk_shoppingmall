package spring.mvc.pj_117_kys.dto;

import java.util.Date;

public class BuyDTO {
	private int buyNo; 			// 구매번호 pk
	private int pdNo;			// 상품번호 (product)
	private int orderNo; 		// 주문번호 (order)
	private int buyCnt; 		// 구매 수량
	private int buyTotal; 		// 구매 가격
	private String pdName;		// 상품명
	private String pdImg;		// 이미지
	private String id;			// 아이디
	private String name;		// 이름
	private String phone; 		// 휴대폰
	private String email;		// 이메일
	private String buyState; 	// 주문상태
	private Date buyDate; 		// 주문일	
	
	// 디폴트
	public BuyDTO() {}
	
	// setter / getter
	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public int getBuyTotal() {
		return buyTotal;
	}

	public void setBuyTotal(int buyTotal) {
		this.buyTotal = buyTotal;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBuyState() {
		return buyState;
	}

	public void setBuyState(String buyState) {
		this.buyState = buyState;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	@Override
	public String toString() {
		return "BuyDTO [buyNo=" + buyNo + ", pdNo=" + pdNo + ", orderNo=" + orderNo + ", buyCnt=" + buyCnt
				+ ", buyTotal=" + buyTotal + ", pdName=" + pdName + ", pdImg=" + pdImg + ", id=" + id + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", buyState=" + buyState + ", buyDate=" + buyDate + "]";
	}		
	
}
