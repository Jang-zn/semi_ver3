package com.semi.board.model.vo;

import java.util.*;

public class Reply {
	private int replyNo;
	private int contentNo;
	private String writer;
	private String replyContent;
	private Date replyDate;
	private int replyLevel;
	private int replyNoRef;

	
	public Reply() {}


	public Reply(int replyNo, int contentNo, String writer, String replyContent, Date replyDate, int replyLevel,
			int replyNoRef) {
		super();
		this.replyNo = replyNo;
		this.contentNo = contentNo;
		this.writer = writer;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyLevel = replyLevel;
		this.replyNoRef = replyNoRef;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public int getContentNo() {
		return contentNo;
	}


	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	public int getReplyLevel() {
		return replyLevel;
	}


	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}


	public int getReplyNoRef() {
		return replyNoRef;
	}


	public void setReplyNoRef(int replyNoRef) {
		this.replyNoRef = replyNoRef;
	}
	
	
	
	
}
