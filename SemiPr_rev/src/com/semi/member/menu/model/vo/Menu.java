package com.semi.member.menu.model.vo;

public class Menu {
	private String menuId;
	private String menuSort;
	private String menuName;
	private String menuImg;
	
	public Menu() {
	
	}

	public Menu(String menuId, String menuSort, String menuName, String menuImg) {
		super();
		this.menuId = menuId;
		this.menuSort = menuSort;
		this.menuName = menuName;
		this.menuImg = menuImg;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
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

	public String getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	
	
}
