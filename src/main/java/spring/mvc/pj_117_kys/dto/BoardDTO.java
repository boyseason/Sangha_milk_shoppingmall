package spring.mvc.pj_117_kys.dto;

import java.sql.Date;

// DTO(Data Transfer Object) : setter > 멤버변수 > getter 
/**
 * @author kosmo
 *
 */
public class BoardDTO {
	
	/*
	CREATE TABLE mvc_board_tbl(
	num			number(7) 		PRIMARY KEY,
	title 		varchar2(50) 	NOT NULL,
	content		clob 			NOT NULL, -- 글내용 
	writer		varchar2(20) 	NOT NULL,
	password	varchar2(20) 	NOT NULL, -- 게시글 비밀번호
	readCnt		number(6) 		DEFAULT 0, -- 조회수
	regDate 	DATE			DEFAULT sysdate -- 등록일
	);
	 */

	private int num; 	// 글 번호
	private String title; // 글제목
	private String content; // 글내용
	private String writer; // 작성자
	private String password; // 게시글비밀번호
	private int readCnt; // 조회수
	private Date regDate; // 등록일
	private int comment_count; // 댓글 갯수
	
	// 디폴트
	public BoardDTO() {};
	
	// setter / getter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	// toString()
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", password=" + password + ", readCnt=" + readCnt + ", regDate=" + regDate + ", comment_count : " + comment_count + "]";
	}
}
