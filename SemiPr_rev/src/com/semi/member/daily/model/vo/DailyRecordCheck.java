package com.semi.member.daily.model.vo;

public class DailyRecordCheck {

	private String menuYN;
	private String excYN;
	
	public DailyRecordCheck() {
		// TODO Auto-generated constructor stub
	}

	public DailyRecordCheck(String menuYN, String excYN) {
		super();
		this.menuYN = menuYN;
		this.excYN = excYN;
	}

	public String getMenuYN() {
		return menuYN;
	}

	public void setMenuYN(String menuYN) {
		this.menuYN = menuYN;
	}

	public String getExcYN() {
		return excYN;
	}

	public void setExcYN(String excYN) {
		this.excYN = excYN;
	}

	
}
