package com.semi.member.model.vo;

public class MemberMenuList {
	private String memberId;
	private String menuId;
	private String menuId_c;
	private int amount;
	private String menuWeek;
	private String menuDaytime;
	
	public MemberMenuList() {
	
	}

	public MemberMenuList(String memberId, String menuId, String menuId_c, int amount, String menuWeek,
			String menuDaytime) {
		super();
		this.memberId = memberId;
		this.menuId = menuId;
		this.menuId_c = menuId_c;
		this.amount = amount;
		this.menuWeek = menuWeek;
		this.menuDaytime = menuDaytime;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getMenuWeek() {
		return menuWeek;
	}

	public void setMenuWeek(String menuWeek) {
		this.menuWeek = menuWeek;
	}

	public String getMenuDaytime() {
		return menuDaytime;
	}

	public void setMenuDaytime(String menuDaytime) {
		this.menuDaytime = menuDaytime;
	}
	
	
	
}
