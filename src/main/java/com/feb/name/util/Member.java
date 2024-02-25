package com.feb.name.util;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {
	private int memberIdx;
	private String memberId;
	private String passwd;
	private String nickname;
	private String memberName;
	private String email;
	private String joinDtm;
	
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinDtm() {
		return joinDtm;
	}
	public void setJoinDtm(String joinDtm) {
		this.joinDtm = joinDtm;
	}
	@Override
	public String toString() {
		return "Member [memberIdx=" + memberIdx + ", memberId=" + memberId + ", passwd=" + passwd + ", nickname="
				+ nickname + ", memberName=" + memberName + ", email=" + email + ", joinDtm=" + joinDtm + "]";
	}
	
	
}