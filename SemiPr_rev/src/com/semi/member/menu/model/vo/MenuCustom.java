package com.semi.member.menu.model.vo;

public class MenuCustom {
	private String menuId_c;
	private String menuSort;
	private String menuName_c;
	private String menuManual_c;
	
	
	public MenuCustom() {
	
	}


	public MenuCustom(String menuId_c, String menuSort, String menuName_c, String menuManual_c) {
		super();
		this.menuId_c = menuId_c;
		this.menuSort = menuSort;
		this.menuName_c = menuName_c;
		this.menuManual_c = menuManual_c;
	}


	public String getMenuId_c() {
		return menuId_c;
	}


	public void setMenuId_c(String menuId_c) {
		this.menuId_c = menuId_c;
	}


	public String getMenuSort() {
		return menuSort;
	}


	public void setMenuSort(String menuSort) {
		this.menuSort = menuSort;
	}


	public String getMenuName_c() {
		return menuName_c;
	}


	public void setMenuName_c(String menuName_c) {
		this.menuName_c = menuName_c;
	}


	public String getMenuManual_c() {
		return menuManual_c;
	}


	public void setMenuManual_c(String menuManual_c) {
		this.menuManual_c = menuManual_c;
	}

	
	
}