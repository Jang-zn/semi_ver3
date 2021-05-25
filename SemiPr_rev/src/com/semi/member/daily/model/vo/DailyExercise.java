package com.semi.member.daily.model.vo;

import java.util.*;

public class DailyExercise {
	private Date excDate;
	private String memberId;
	private String excId;
	private String excId_c;
	private String excPlanCheck;
	private String reason;
	
	public DailyExercise() {
	
	}

	public DailyExercise(Date excDate, String memberId, String excId, String excId_c, String excPlanCheck,
			String reason) {
		super();
		this.excDate = excDate;
		this.memberId = memberId;
		this.excId = excId;
		this.excId_c = excId_c;
		this.excPlanCheck = excPlanCheck;
		this.reason = reason;
	}

	public Date getExcDate() {
		return excDate;
	}

	public void setExcDate(Date excDate) {
		this.excDate = excDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getExcId() {
		return excId;
	}

	public void setExcId(String excId) {
		this.excId = excId;
	}

	public String getExcId_c() {
		return excId_c;
	}

	public void setExcId_c(String excId_c) {
		this.excId_c = excId_c;
	}

	public String getExcPlanCheck() {
		return excPlanCheck;
	}

	public void setExcPlanCheck(String excPlanCheck) {
		this.excPlanCheck = excPlanCheck;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
