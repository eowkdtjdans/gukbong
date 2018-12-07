package com.spring.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {
	
	//회원가입
	void insertMember(MemberVO vo);
	
	//로그인
	//public void loginMember(MemberVO vo, Model model);
	public MemberVO loginMember(MemberVO vo, HttpSession session);
	
	public void logoutMember(HttpSession session);
	
	
}
