package com.semi.member.model.vo;

import java.util.Date;

public class Member {
	private String memberId;
	private String memberPw;
	private String email;
	private String name;
	private String nickname;
	private Date birth;
	private String phone;
	private double height;
	private double weight;
	private String gender;
	private Date enrollDate;
	private String profileImg;
	
	
	public Member() {}


	public Member(String memberId, String memberPw, String email, String name, String nickname, String phone,
			Date birth, double height, double weight, String gender, Date enrollDate, String profileImg) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.birth = birth;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.profileImg = profileImg;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPw() {
		return memberPw;
	}


	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public double getHeight() {
		return height;
	}


	public void setHeight(double height) {
		this.height = height;
	}


	public double getWeight() {
		return weight;
	}


	public void setWeight(double weight) {
		this.weight = weight;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	
		
	
}
