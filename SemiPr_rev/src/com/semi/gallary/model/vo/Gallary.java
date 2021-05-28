package com.semi.gallary.model.vo;

import java.util.*;

public class Gallary {
	private int galNo;
	private Date gallaryDate;
	private String memberId;
	private String writer;
	private String comment;
	private String shareCheck="N";
	
	public Gallary() {}

	public Gallary(int galNo, Date gallaryDate, String memberId, String writer, String comment, String shareCheck) {
		super();
		this.galNo = galNo;
		this.gallaryDate = gallaryDate;
		this.memberId = memberId;
		this.writer = writer;
		this.comment = comment;
		this.shareCheck = shareCheck;
	}

	public int getGalNo() {
		return galNo;
	}

	public void setGalNo(int galNo) {
		this.galNo = galNo;
	}

	public Date getGallaryDate() {
		return gallaryDate;
	}

	public void setGallaryDate(Date gallaryDate) {
		this.gallaryDate = gallaryDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getShareCheck() {
		return shareCheck;
	}

	public void setShareCheck(String shareCheck) {
		this.shareCheck = shareCheck;
	}
	
}
