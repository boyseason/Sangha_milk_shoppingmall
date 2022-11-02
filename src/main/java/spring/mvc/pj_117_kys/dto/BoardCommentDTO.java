package spring.mvc.pj_117_kys.dto;

import java.util.Date;

// 게시판 댓글 DTO
public class BoardCommentDTO {
	private int comment_num; // 댓글 번호
	private int board_num; // 게시글 번호
	private String writer; // 작성자
	private String content; // 내용
	private Date reg_date; // 작성일
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "BoardCommentDTO [comment_num=" + comment_num + ", board_num=" + board_num + ", writer=" + writer
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	/*
	CREATE TABLE mvc_board_comment_tbl(
	comment_num NUMBER(7) 		PRIMARY KEY, -- pk 댓글 일련번호
	board_num	NUMBER(7) 		NOT NULL REFERENCES mvc_board_tbl(num), -- fk 게시글 번호
	writer 		varchar2(50) 	NOT NULL, -- 작성자
	content	 	clob  			NOT NULL, -- 내용
	reg_date 	DATE 			DEFAULT sysdate -- 작성일
	); 
	 */
}
