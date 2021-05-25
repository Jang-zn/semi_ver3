package com.semi.member.model.vo;

public class MemberExcList {
	private String memberId;
	private String excId;
	private String excId_c;
	private int reps;
	private int sets;
	private double weight;
	private String excWeek;
	
	public MemberExcList() {
	
	}

	public MemberExcList(String memberId, String excId, String excId_c, int reps, int sets, double weight,
			String excWeek) {
		super();
		this.memberId = memberId;
		this.excId = excId;
		this.excId_c = excId_c;
		this.reps = reps;
		this.sets = sets;
		this.weight = weight;
		this.excWeek = excWeek;
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
	
	
	
}
