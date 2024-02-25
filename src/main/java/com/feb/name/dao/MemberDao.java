package com.feb.name.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {
	public int confirmId(String id);
	public int join(HashMap<String, String> params);
}
