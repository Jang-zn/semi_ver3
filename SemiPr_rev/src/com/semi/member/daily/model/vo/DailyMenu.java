package com.semi.member.daily.model.vo;

import java.util.*;

public class DailyMenu {
	private Date menuDate;
	private String memberId;
	private String menuId;
	private String menuId_c;
	private String menuPlanCheck;
	private String reason;
	
	public DailyMenu() {
	
	}

	public DailyMenu(Date menuDate, String memberId, String menuId, String menuId_c, String menuPlanCheck,
			String reason) {
		super();
		this.menuDate = menuDate;
		this.memberId = memberId;
		this.menuId = menuId;
		this.menuId_c = menuId_c;
		this.menuPlanCheck = menuPlanCheck;
		this.reason = reason;
	}

	public Date getMenuDate() {
		return menuDate;
	}

	public void setMenuDate(Date menuDate) {
		this.menuDate = menuDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuId_c() {
		return menuId_c;
	}

	public void setMenuId_c(String menuId_c) {
		this.menuId_c = menuId_c;
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
