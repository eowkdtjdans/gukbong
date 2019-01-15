package com.spring.biz.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;


public interface MemberService {
	

	//회원가입
	 void insertMember(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO vo, HttpSession session) throws Exception;
	
	
	
	//로그아웃
	public void logoutMember(HttpSession session) throws Exception;


	//public int idCheck(String m_id) throws Exception;
	
	
	//아이디 찾기
	public MemberVO getId(Map<String, Object> paramMap);
	//비밀번호 찾기
	public MemberVO getPw(Map<String, Object> paramMap);

	 
	//List<MemberVO> idcheck(String m_id);
	
	 //로그인 체크
	public int loginCheck(String m_id, String m_pwd);

	//비밀번호 찾기 JSON
	int findPwdMemberJson(MemberVO vo);
	
	//로그인 JSON
	int loginMemberJson(MemberVO vo);
	
	//아이디 중복체크 JSON
	int findIdMemberJson(MemberVO vo);
	
	//핸드폰 중복체크 JSON
	int checkPhoneJson(String m_phone);

	 //아이디 중복체크 JSON
	int checkMemberJson(String m_id);
	
	//비밀번호 수정 JSON
	int ModifyMemberPwdJson(MemberVO vo);
	
	//핸드폰 번호 수정 JSON
	int ModifyMemberPhoneJson(MemberVO vo);
	
	//회원 삭제 JSON
	int MemberDeleteJson(MemberVO vo);
	
	//핸드폰 번호 변경
	void ModifyPhone(MemberVO vo);

	//비밀번호 변경
	void ModifyPwd(MemberVO vo);
	
	//주소 변경
	void ModifyAddress(MemberVO vo);

	//회원정보 삭제
	void DeleteMember(MemberVO vo);

	void certifyCodeUpdate(MemberVO vo);

	void PwdUpdate(MemberVO vo);


	
	
	

	

	

		


	


}
