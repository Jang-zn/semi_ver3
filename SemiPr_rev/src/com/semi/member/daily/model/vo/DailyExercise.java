package com.semi.member.daily.model.vo;

import java.util.*;

public class DailyExercise {
	private int eLogNo;
	private int excNo;
	private Date excDate;
	private String excPlanCheck;
	private String reason;
	
	public DailyExercise() {
	
	}

	public DailyExercise(int eLogNo, int excNo, Date excDate, String excPlanCheck, String reason) {
		super();
		this.eLogNo = eLogNo;
		this.excNo = excNo;
		this.excDate = excDate;
		this.excPlanCheck = excPlanCheck;
		this.reason = reason;
	}

	public int geteLogNo() {
		return eLogNo;
	}

	public void seteLogNo(int eLogNo) {
		this.eLogNo = eLogNo;
	}

	public int getExcNo() {
		return excNo;
	}

	public void setExcNo(int excNo) {
		this.excNo = excNo;
	}

	public Date getExcDate() {
		return excDate;
	}

	public void setExcDate(Date excDate) {
		this.excDate = excDate;
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
