package com.semi.member.exc.model.vo;

public class ExerciseCustom {
	private String excId_c;
	private String excSort;
	private String excName;
	
	
	public ExerciseCustom() {
		// TODO Auto-generated constructor stub
	}


	public ExerciseCustom(String excId_c, String excSort, String excName) {
		super();
		this.excId_c = excId_c;
		this.excSort = excSort;
		this.excName = excName;
	}


	public String getExcId_c() {
		return excId_c;
	}


	public void setExcId_c(String excId_c) {
		this.excId_c = excId_c;
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
}
	
	