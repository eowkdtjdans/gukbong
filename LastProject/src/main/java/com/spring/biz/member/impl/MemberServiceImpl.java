package com.spring.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAOMybatis memberDAO;
	
	public MemberServiceImpl() {
		System.out.println("MemberServiceImpl 객체 생성 ===");
	}
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	@Override
	public void loginMember(MemberVO vo) {
		memberDAO.loginMember(vo);
		
	}

}
