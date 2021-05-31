package com.semi.member.daily.model.vo;

import java.util.*;

public class DailyMenu {
	private int mLogNo;
	private int menuNo;
	private Date menuDate;
	private String menuPlanCheck;
	private String reason;
	
	public DailyMenu() {
	
	}

	public DailyMenu(int mLogNo, int menuNo, Date menuDate, String menuPlanCheck, String reason) {
		super();
		this.mLogNo = mLogNo;
		this.menuNo = menuNo;
		this.menuDate = menuDate;
		this.menuPlanCheck = menuPlanCheck;
		this.reason = reason;
	}

	public int getmLogNo() {
		return mLogNo;
	}

	public void setmLogNo(int mLogNo) {
		this.mLogNo = mLogNo;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public Date getMenuDate() {
		return menuDate;
	}

	public void setMenuDate(Date menuDate) {
		this.menuDate = menuDate;
	}

	public String getMenuPlanCheck() {
		return menuPlanCheck;
	}

	public void setMenuPlanCheck(String menuPlanCheck) {
		this.menuPlanCheck = menuPlanCheck;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	
	
	
}
