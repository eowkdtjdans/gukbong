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
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}
	
	@Override
	/*public void loginMember(MemberVO vo, Model model) {
		
			model.addAttribute("m_id", vo.getM_id());
			model.addAttribute("m_pwd", vo.getM_pwd());
			memberDAO.loginMember(vo, model);
	}*/
	public MemberVO loginMember(MemberVO vo, HttpSession session) {
	
		session.setAttribute("m_id", vo.getM_id());
		
	return memberDAO.loginMember(vo);
}
	
	@Override
	public void logoutMember(HttpSession session) {
		session.invalidate();
		
	}



}
