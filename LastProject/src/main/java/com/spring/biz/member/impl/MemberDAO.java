package com.spring.biz.member.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원가입
	public void insertMember(MemberVO vo) throws Exception {
		
		System.out.println("======== insertMember() =========");
		mybatis.insert("insertMember", vo);
	}
	
	//로그인
	public MemberVO loginMember(MemberVO vo) throws Exception {
		
		System.out.println("======== loginMember() =========");
		return mybatis.selectOne("loginMember", vo);
	}
	
	//로그아웃
	public void logout(HttpSession session) throws Exception {
		System.out.println("======== logoutMember() =========");
	}

	//아이디 중복확인
	public List<MemberVO> idCheck(MemberVO vo) {
		List<MemberVO> list = mybatis.selectOne("idCheck", vo);
		return list;
	}

	public String getPw(Map<String, Object> paramMap) {
		return mybatis.selectOne("getPw", paramMap);
	}
	

	
}
