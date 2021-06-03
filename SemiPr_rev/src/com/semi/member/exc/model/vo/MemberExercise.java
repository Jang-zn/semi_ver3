package com.semi.member.exc.model.vo;

public class MemberExercise {
	private int excNo;
	private String memberId;
	private String excId;
	private String excId_c;
	private int reps;
	private int sets;
	private int weight;
	private String excWeek;
	
	public MemberExercise() {
	
	}

	public MemberExercise(int excNo, String memberId, String excId, String excId_c, int reps, int sets, int weight,
			String excWeek) {
		super();
		this.excNo = excNo;
		this.memberId = memberId;
		this.excId = excId;
		this.excId_c = excId_c;
		this.reps = reps;
		this.sets = sets;
		this.weight = weight;
		this.excWeek = excWeek;
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

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getExcWeek() {
		return excWeek;
	}

	public void setExcWeek(String excWeek) {
		this.excWeek = excWeek;
	}
	
	
	
}
