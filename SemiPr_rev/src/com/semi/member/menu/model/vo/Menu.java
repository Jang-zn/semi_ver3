package com.semi.member.menu.model.vo;

import java.util.List;

public class Menu {
	private String menuId;
	private String menuSort;
	private String menuName;
	private int kcal;
	private int ch;
	private int prot;
	private int fat;
	private int na;
	private String menuManual;
	private String menuVideo;
	private String imgpath;
	private List<String> fileList;

	
	public Menu() {
	
	}


	public Menu(String menuId, String menuSort, String menuName, int kcal, int ch, int prot, int fat, int na,
			String menuManual, String menuVideo, String imgpath, List<String> fileList) {
		super();
		this.menuId = menuId;
		this.menuSort = menuSort;
		this.menuName = menuName;
		this.kcal = kcal;
		this.ch = ch;
		this.prot = prot;
		this.fat = fat;
		this.na = na;
		this.menuManual = menuManual;
		this.menuVideo = menuVideo;
		this.imgpath = imgpath;
		this.fileList = fileList;
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


	public String getMenuVideo() {
		return menuVideo;
	}


	public void setMenuVideo(String menuVideo) {
		this.menuVideo = menuVideo;
	}


	public String getImgpath() {
		return imgpath;
	}


	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}


	public List<String> getFileList() {
		return fileList;
	}


	public void setFileList(List<String> fileList) {
		this.fileList = fileList;
	}

		
	
}
