package com.spring.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("=======멤버 컨트롤러 시작");
	}
	
	@RequestMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		System.out.println("=======인서트시작");
		memberService.insertMember(vo);
		return "views/Travelers.jsp";
	}
	
}
