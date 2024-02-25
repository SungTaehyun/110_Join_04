package com.feb.name.dao;

import org.springframework.stereotype.Repository;

import com.feb.name.util.Member;

@Repository
public interface LoginDao {
	
	public Member login(String memberId);//Member는 타입
	
//	// ID 중복 확인을 위한 메서드
//		public int Loginchick(String memberId);
}
