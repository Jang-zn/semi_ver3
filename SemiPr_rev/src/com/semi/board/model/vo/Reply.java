package com.semi.board.model.vo;

import java.util.*;

public class Reply {
	private int contentNo;
	String memberIdReply;
	String replyContent;
	Date replyDate;
	
	public Reply() {}

	public Reply(int contentNo, String memberIdReply, String replyContent, Date replyDate) {
		super();
		this.contentNo = contentNo;
		this.memberIdReply = memberIdReply;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getMemberIdReply() {
		return memberIdReply;
	}

	public void setMemberIdReply(String memberIdReply) {
		this.memberIdReply = memberIdReply;
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
	
	
}
