package com.semi.member.exc.model.vo;

public class Exercise {
	private String excId;
	private String excSort;
	private String excName;
	private String excImg;
	
	public Exercise() {
	
	}

	public Exercise(String excId, String excSort, String excName, String excImg) {
		super();
		this.excId = excId;
		this.excSort = excSort;
		this.excName = excName;
		this.excImg = excImg;
	}

	public String getExcId() {
		return excId;
	}

	public void setExcId(String excId) {
		this.excId = excId;
	}

	public String getExcSort() {
		return excSort;
	}

	public void setExcSort(String excSort) {
		this.excSort = excSort;
	}

	public String getExcName() {
		return excName;
	}

	public void setExcName(String excName) {
		this.excName = excName;
	}

	public String getExcImg() {
		return excImg;
	}

	public void setExcImg(String excImg) {
		this.excImg = excImg;
	}
	
	
	
	
	
}
