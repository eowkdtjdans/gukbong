package com.spring.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;

@Repository("memberDAOMybatis")
public class MemberDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMember(MemberVO vo) {
		
		System.out.println("======== insertMember() =========");
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	public void loginMember(MemberVO vo) {
		
		System.out.println("======== loginMember() =========");
		mybatis.selectOne("MemberDAO.loginMember", vo);
	}
	
}
