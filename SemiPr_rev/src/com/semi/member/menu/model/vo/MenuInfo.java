package com.semi.member.menu.model.vo;

public class MenuInfo {
	private int contentNo;
	private String menuId;
	private int kcal;
	private int ch;
	private int prot;
	private int fat;
	private int na;
	private String menuManual;
	private String recipe;
	private String menuLinkVideo;
	private String menuLinkImg;
	
	public MenuInfo() {
	
	}

	public MenuInfo(int contentNo, String menuId, int kcal, int ch, int prot, int fat, int na, String menuManual,
			String recipe, String menuLinkVideo, String menuLinkImg) {
		super();
		this.contentNo = contentNo;
		this.menuId = menuId;
		this.kcal = kcal;
		this.ch = ch;
		this.prot = prot;
		this.fat = fat;
		this.na = na;
		this.menuManual = menuManual;
		this.recipe = recipe;
		this.menuLinkVideo = menuLinkVideo;
		this.menuLinkImg = menuLinkImg;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
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

	public String getMenuManual() {
		return menuManual;
	}

	public void setMenuManual(String menuManual) {
		this.menuManual = menuManual;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getMenuLinkVideo() {
		return menuLinkVideo;
	}

	public void setMenuLinkVideo(String menuLinkVideo) {
		this.menuLinkVideo = menuLinkVideo;
	}

	public String getMenuLinkImg() {
		return menuLinkImg;
	}

	public void setMenuLinkImg(String menuLinkImg) {
		this.menuLinkImg = menuLinkImg;
	}
	
	
	

}
