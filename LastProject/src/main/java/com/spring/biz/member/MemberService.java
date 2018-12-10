package com.spring.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberService {
	
	//회원가입
	 void insertMember(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO vo, HttpSession session) throws Exception;
	
	//로그아웃
	public void logoutMember(HttpSession session) throws Exception;


	public List<MemberVO> idCheck(MemberVO vo) throws Exception;
	
	
	//비밀번호 찾기
	public String getPw(Map<String, Object> paramMap);
	

		


	


}
