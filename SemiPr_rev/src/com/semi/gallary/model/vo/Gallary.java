package com.semi.gallary.model.vo;

import java.util.Date;

public class Gallary {
	private int galNo;
	private Date gallaryDate;
	private String memberId;
	private String writer;
	private String content;
	private String shareCheck="N";
	private String imgName;
	
	
	public Gallary() {}

	public Gallary(int galNo, Date gallaryDate, String memberId, String writer, String content, String shareCheck,String imgName) {
		super();
		this.galNo = galNo;
		this.gallaryDate = gallaryDate;
		this.memberId = memberId;
		this.writer = writer;
		this.content = content;
		this.shareCheck = shareCheck;
		this.imgName= imgName;
		
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShareCheck() {
		return shareCheck;
	}

	public void setShareCheck(String shareCheck) {
		this.shareCheck = shareCheck;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String ImgName) {
		this.imgName = ImgName;
	}

	
}
