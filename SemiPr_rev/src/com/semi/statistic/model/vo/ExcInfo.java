package com.semi.statistic.model.vo;

public class ExcInfo {

	String excId;
	String excSort;
	String excName;
	String excManual;
	
	public ExcInfo() {
		// TODO Auto-generated constructor stub
	}

	public ExcInfo(String excId, String excSort, String excName, String excManual) {
		super();
		this.excId = excId;
		this.excSort = excSort;
		this.excName = excName;
		this.excManual = excManual;
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
	
	
	
	
}
