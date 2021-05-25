package com.semi.member.exc.model.vo;

public class ExerciseInfo {
	private int contentNo;
	private String excId;
	private String excManual;
	private String excWarning;
	private String excLinkVideo;
	private String excLinkImg;
	
	public ExerciseInfo() {
	
	}

	public ExerciseInfo(int contentNo, String excId, String excManual, String excWarning, String excLinkVideo,
			String excLinkImg) {
		super();
		this.contentNo = contentNo;
		this.excId = excId;
		this.excManual = excManual;
		this.excWarning = excWarning;
		this.excLinkVideo = excLinkVideo;
		this.excLinkImg = excLinkImg;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getExcId() {
		return excId;
	}

	public void setExcId(String excId) {
		this.excId = excId;
	}

	public String getExcManual() {
		return excManual;
	}

	public void setExcManual(String excManual) {
		this.excManual = excManual;
	}

	public String getExcWarning() {
		return excWarning;
	}

	public void setExcWarning(String excWarning) {
		this.excWarning = excWarning;
	}

	public String getExcLinkVideo() {
		return excLinkVideo;
	}

	public void setExcLinkVideo(String excLinkVideo) {
		this.excLinkVideo = excLinkVideo;
	}

	public String getExcLinkImg() {
		return excLinkImg;
	}

	public void setExcLinkImg(String excLinkImg) {
		this.excLinkImg = excLinkImg;
	}
	
	
}
