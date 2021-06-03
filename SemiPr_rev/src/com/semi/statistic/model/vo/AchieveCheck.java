package com.semi.statistic.model.vo;

import java.sql.Date;

public class AchieveCheck {
	private String memberId;
	private String achieveId;
	private Date achieveDate;
	private String achieveCheck;
	
	public AchieveCheck() {
		// TODO Auto-generated constructor stub
	}

	
	public AchieveCheck(String memberId, String achieveId, Date achieveDate, String achieveCheck) {
		super();
		this.memberId = memberId;
		this.achieveId = achieveId;
		this.achieveDate = achieveDate;
		this.achieveCheck = achieveCheck;
	}


	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAchieveId() {
		return achieveId;
	}

	public void setAchieveId(String achieveId) {
		this.achieveId = achieveId;
	}

	public Date getAchieveDate() {
		return achieveDate;
	}

	public void setAchieveDate(Date achieveDate) {
		this.achieveDate = achieveDate;
	}

	public String getAchieveCheck() {
		return achieveCheck;
	}

	public void setAchieveCheck(String achieveCheck) {
		this.achieveCheck = achieveCheck;
	}
	
	
	
	

}
