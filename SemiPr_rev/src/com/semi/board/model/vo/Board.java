package com.semi.board.model.vo;

import java.util.*;

public class Board {
	private int contentNo;
	private String title;
	private String category;
	private String content;
	private String writer;
	private int readCount;
	private Date writeDate;
	private String memberId;
	
	public Board() {}

	public Board(int contentNo, String title, String category, String content, String writer, int readCount,
			Date writeDate, String memberId) {
		this.contentNo = contentNo;
		this.title = title;
		this.category = category;
		this.content = content;
		this.writer = writer;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.memberId = memberId;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
