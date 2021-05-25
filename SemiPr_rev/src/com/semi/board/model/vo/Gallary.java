package com.semi.board.model.vo;

import java.util.*;

public class Gallary {
	Date gallaryDate;
	String memberId;
	String nickname;
	String comment;
	String shareCheck="N";
	
	public Gallary() {}

	public Gallary(Date gallaryDate, String memberId, String nickname, String comment, String shareCheck) {
		super();
		this.gallaryDate = gallaryDate;
		this.memberId = memberId;
		this.nickname = nickname;
		this.comment = comment;
		this.shareCheck = shareCheck;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
