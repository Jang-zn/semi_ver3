package com.semi.board.model.vo;

import java.util.*;

public class Board {
	private int contentNo;
	private String title;
	private String category;
	private String content;
	private String nickname;
	private int readCount;
	private int goodCount;
	private Date writeDate;
	
	public Board() {}

	public Board(int contentNo, String title, String category, String content, String nickname, int readCount,
			int goodCount, Date writeDate) {
		super();
		this.contentNo = contentNo;
		this.title = title;
		this.category = category;
		this.content = content;
		this.nickname = nickname;
		this.readCount = readCount;
		this.goodCount = goodCount;
		this.writeDate = writeDate;
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

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
