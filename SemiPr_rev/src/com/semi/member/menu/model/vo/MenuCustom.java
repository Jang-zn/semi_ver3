package com.semi.member.menu.model.vo;

public class MenuCustom {
	private String menuId_c;
	private String menuSort;
	private String menuName;
	
	
	public MenuCustom() {
	
	}


	public MenuCustom(String menuId_c, String menuSort, String menuName) {
		super();
		this.menuId_c = menuId_c;
		this.menuSort = menuSort;
		this.menuName = menuName;
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


	public String getMenuName() {
		return menuName;
	}


	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	
	
}