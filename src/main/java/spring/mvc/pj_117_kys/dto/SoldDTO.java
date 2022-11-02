package spring.mvc.pj_117_kys.dto;

import java.util.Date;

public class SoldDTO {
	private int soldCnt; 		// 구매 건수
	private int soldTotal; 	// 구매 가격
	private Date soldDate; 		// 주문일	
	
	// 디폴트
	public SoldDTO() {}

	// setter / getter
	public int getSoldCnt() {
		return soldCnt;
	}

	public void setSoldCnt(int soldCnt) {
		this.soldCnt = soldCnt;
	}

	public int getSoldTotal() {
		return soldTotal;
	}

	public void setSoldTotal(int soldTotal) {
		this.soldTotal = soldTotal;
	}

	public Date getSoldDate() {
		return soldDate;
	}

	public void setSoldDate(Date soldDate) {
		this.soldDate = soldDate;
	}

	@Override
	public String toString() {
		return "SoldDTO [soldCnt=" + soldCnt + ", soldTotal=" + soldTotal + ", soldDate=" + soldDate + "]";
	}	
}
