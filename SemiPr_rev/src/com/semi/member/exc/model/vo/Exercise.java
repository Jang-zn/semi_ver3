package com.semi.member.exc.model.vo;

public class Exercise {
	private String excId;
	private String excSort;
	private String excName;
	private String excManual;
	private String excVideo;
	private String imgpath;
	
	public Exercise() {
	
	}

	public Exercise(String excId, String excSort, String excName, String excManual, String excVideo,String imgpath) {
		super();
		this.excId = excId;
		this.excSort = excSort;
		this.excName = excName;
		this.excManual = excManual;
		this.excVideo = excVideo;
		this.imgpath=imgpath;
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

	public String getExcManual() {
		return excManual;
	}

	public void setExcManual(String excManual) {
		this.excManual = excManual;
	}

	public String getExcVideo() {
		return excVideo;
	}

	public void setExcVideo(String excVideo) {
		this.excVideo = excVideo;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	
	
	
}
