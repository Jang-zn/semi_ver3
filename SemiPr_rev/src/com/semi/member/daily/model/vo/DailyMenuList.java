package com.semi.member.daily.model.vo;

public class DailyMenuList {
	private int menuNo;
	private String memberId;
	private String menuId;
	private String menuId_c;
	private int amount;
	private String menuWeek;
	private String menuDaytime;
	private String menuName;
	private int kcal;
	private int ch;
	private int prot;
	private int fat;
	private int na;
	public DailyMenuList() {
		// TODO Auto-generated constructor stub
	}
	public DailyMenuList(int menuNo, String memberId, String menuId, String menuId_c, int amount, String menuWeek,
			String menuDaytime, String menuName, int kcal, int ch, int prot, int fat, int na) {
		super();
		this.menuNo = menuNo;
		this.memberId = memberId;
		this.menuId = menuId;
		this.menuId_c = menuId_c;
		this.amount = amount;
		this.menuWeek = menuWeek;
		this.menuDaytime = menuDaytime;
		this.menuName = menuName;
		this.kcal = kcal;
		this.ch = ch;
		this.prot = prot;
		this.fat = fat;
		this.na = na;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
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
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getCh() {
		return ch;
	}
	public void setCh(int ch) {
		this.ch = ch;
	}
	public int getProt() {
		return prot;
	}
	public void setProt(int prot) {
		this.prot = prot;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getNa() {
		return na;
	}
	public void setNa(int na) {
		this.na = na;
	}
	
	
}
