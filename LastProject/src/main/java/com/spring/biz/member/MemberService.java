package com.spring.biz.member;

import java.util.List;

public interface MemberService {
	
	//회원가입
	void insertMember(MemberVO vo);
	
	//로그인
	void loginMember(MemberVO vo);
	
}
