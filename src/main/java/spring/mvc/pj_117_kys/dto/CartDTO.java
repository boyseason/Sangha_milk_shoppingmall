package spring.mvc.pj_117_kys.dto;

public class CartDTO {
	private String id;		// 아이디 (customer)
	private int pdNo;		// 상품 번호 (product)
	private int cartNo;		// 장바구니 번호 (cart)
	private String pdImg;	// 이미지
	private int cartCnt;	// 수량
	private String pdName;	// 상품명
	private int price;		// 가격
	private int cartTotal;	// 장바구니 가격
	
	// 디폴트
	public CartDTO() {}

	// setter / getter
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

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getCartTotal() {
		return cartTotal;
	}
	public void setCartTotal(int cartTotal) {
		this.cartTotal = cartTotal;
	}

	@Override
	public String toString() {
		return "CartDTO [id=" + id + ", pdNo=" + pdNo + ", cartNo=" + cartNo + ", pdImg=" + pdImg + ", cartCnt="
				+ cartCnt + ", pdName=" + pdName + ", price=" + price + ", cartTotal=" + cartTotal + "]";
	}
	

}