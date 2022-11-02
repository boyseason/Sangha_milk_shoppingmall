package spring.mvc.pj_117_kys.dto;

import java.util.Date;

public class OrderDTO {
	private int orderNo;	// 주문번호
	private String id;		// 아이디(customer)
	private int pdNo;		// 상품번호(product)
	private String pdImg;	// 이미지
	private int orderCnt;	// 수량
	private String pdName;	// 상품명
	private int price;		// 가격
	private int orderTotal;	// 주문 총 가격
	private String name;	// 이름
	private String address; // 주소
	private String phone;	// 휴대폰번호
	private String email;	// 이메일
	private Date orderDate; // 주문일
	private String orderState; // 주문상태
	
	// 디폴트
	public OrderDTO() {}
	
	//  setter / getter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}


	public String getPdImg() {
		return pdImg;
	}

	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}

	public int getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public int getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderNo=" + orderNo + ", id=" + id + ", pdNo=" + pdNo + ", pdImg=" + pdImg + ", orderCnt="
				+ orderCnt + ", pdName=" + pdName + ", price=" + price + ", orderTotal=" + orderTotal + ", name=" + name
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", orderDate=" + orderDate
				+ ", orderState=" + orderState + "]";
	}	
	
}
