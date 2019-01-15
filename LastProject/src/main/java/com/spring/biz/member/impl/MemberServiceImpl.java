package com.spring.biz.member.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
		System.out.println("MemberServiceImpl 객체 생성 ===");
	}
	
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		memberDAO.insertMember(vo);
	}
	

	
	@Override
	public MemberVO loginMember(MemberVO vo, HttpSession session) throws Exception {
		session.setAttribute("m_id", vo.getM_id());
		session.setAttribute("m_pwd", vo.getM_pwd());
	return memberDAO.loginMember(vo);
	}
	
	@Override
	public void logoutMember(HttpSession session) {
		session.invalidate();
		
	}


 @Override
    public MemberVO getPw(Map<String, Object> paramMap) {
        return memberDAO.getPw(paramMap);
    }
 @Override
	public MemberVO getId(Map<String, Object> paramMap) {
		return memberDAO.getId(paramMap);
	}

	@Override
	public int loginCheck(String m_id, String m_pwd) {
		return memberDAO.loginCheck(m_id, m_pwd);
	}
	

	@Override
	public int checkMemberJson(String m_id) {
		return memberDAO.checkMemberJson(m_id);
	}
	@Override
	public int checkPhoneJson(String m_phone) {
		return memberDAO.checkPhoneJson(m_phone);
	}


	@Override
	public int findPwdMemberJson(MemberVO vo) {
		return memberDAO.findPwdMemberJson(vo);
	}


	@Override
	public int loginMemberJson(MemberVO vo) {
		return memberDAO.loginMemberJson(vo);
	}


	@Override
	public int findIdMemberJson(MemberVO vo) {
		return memberDAO.findIdMemberJson(vo);
	}


	@Override
	public int ModifyMemberPwdJson(MemberVO vo) {
		return memberDAO.ModifyMemberPwdJson(vo);
	}
	@Override
	public int MemberDeleteJson(MemberVO vo) {
		return memberDAO.DeleteMemberJson(vo);
	}

	@Override
	public int ModifyMemberPhoneJson(MemberVO vo) {
		return memberDAO.ModifyMemberPhoneJson(vo);
	}
	
	@Override
	public void ModifyPwd(MemberVO vo) {
		memberDAO.ModifyPwdMember(vo);
	}
	@Override
	public void ModifyPhone(MemberVO vo) {
		 memberDAO.ModifyPhoneMember(vo);
	}


	@Override
	public void DeleteMember(MemberVO vo) {
		memberDAO.DeleteMember(vo);
	}


	@Override
	public void ModifyAddress(MemberVO vo) {
		memberDAO.ModifyAddressMember(vo);
	}


	@Override
	public void certifyCodeUpdate(MemberVO vo) {
		memberDAO.certifyCodeUpdate(vo);
	}


	@Override
	public void PwdUpdate(MemberVO vo) {
		memberDAO.PwdUpdate(vo);
	}









	


	





	




























	

	




}
