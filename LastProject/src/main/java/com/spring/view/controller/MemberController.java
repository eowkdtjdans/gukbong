package com.spring.view.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller 
@SessionAttributes("sessionScope")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("=======멤버 컨트롤러 시작");
	}
	
	//회원가입
	@RequestMapping(value = "/insertMember.do", method=RequestMethod.POST)
	public String insertMemberPost(MemberVO vo) {
		System.out.println("=======인서트시작");
		memberService.insertMember(vo);
		return "views/test.jsp";
	}
	//회원가입
		@RequestMapping(value = "/insertMember.do", method=RequestMethod.GET)
		public String insertMemberGet(MemberVO vo) {
			System.out.println("=======겟방식");
			return "views/member/MemberRegister.jsp";
		}
	
		
		
		//로그인
	@RequestMapping(value="/loginMember.do", method=RequestMethod.POST) 
	public String loginPost(MemberVO vo, HttpSession session) {
		System.out.println(">> 포스트방식 로그인처리");
		MemberVO vo2 = memberService.loginMember(vo, session);
		if (vo2.getM_id() != null) {
			session.setAttribute("m_id", vo.getM_id());
			return "views/sub.jsp";
		} else {
			return "views/test2.jsp";
		}
	}
	@RequestMapping(value="/loginMember.do", method=RequestMethod.GET) 
	public String loginGet(MemberVO vo) {
		System.out.println(">> 겟방식");
			return "views/member/MemberLogin.jsp";
	}
	
	//로그아웃
	@RequestMapping("/logoutMember.do")
	public String logoutMember(HttpSession session) {
		memberService.logoutMember(session);
		return "views/test.jsp";
	}
	
	

	
	
	
}
