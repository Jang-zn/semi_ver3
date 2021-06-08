package com.semi.member.model.vo;

public class MemberExcList {
	private int excNo;
	private String memberId;
	private String excId;
	private String excId_c;
	private int reps;
	private int sets;
	private double weight;
	private String excWeek;
	private String excName;
	
	public MemberExcList() {
	
	}

	public MemberExcList(int excNo, String memberId, String excId, String excId_c, int reps, int sets, double weight,
			String excWeek,String excName) {
		super();
		this.excNo = excNo;
		this.memberId = memberId;
		this.excId = excId;
		this.excId_c = excId_c;
		this.reps = reps;
		this.sets = sets;
		this.weight = weight;
		this.excWeek = excWeek;
		this.excName =excName;
	}

	public int getExcNo() {
		return excNo;
	}

	public void setExcNo(int excNo) {
		this.excNo = excNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getExcId() {
		return excId;
	}

	public void setExcId(String excId) {
		this.excId = excId;
	}

	public String getExcId_c() {
		return excId_c;
	}

	public void setExcId_c(String excId_c) {
		this.excId_c = excId_c;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}

	public int getSets() {
		return sets;
	}

	public void setSets(int sets) {
		this.sets = sets;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getExcWeek() {
		return excWeek;
	}

	public void setExcWeek(String excWeek) {
		this.excWeek = excWeek;
	}

	public String getExcName() {
		return excName;
	}

	public void setExcName(String excName) {
		this.excName = excName;
	}

	
	
}
