package com.spring.biz.member.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import com.spring.biz.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMember(MemberVO vo) {
		
		System.out.println("======== insertMember() =========");
		mybatis.insert("insertMember", vo);
	}
	
	public MemberVO loginMember(MemberVO vo) {
		
		System.out.println("======== loginMember() =========");
		return mybatis.selectOne("loginMember", vo);
	}
	
	public void logout(HttpSession session) {
		
	}

	
}
